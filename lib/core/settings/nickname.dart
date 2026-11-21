import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preferences.dart';

/// Longest nickname kept (characters); longer input is cut.
const int kNicknameMaxLength = 24;

/// The user's nickname and whether the first-launch prompt was answered.
@immutable
class NicknameState {
  const NicknameState({this.name, this.prompted = false});

  /// What celebrations call the user; null when none was given.
  final String? name;

  /// The welcome prompt was answered ("Let's Go" or "Skip") and is never
  /// shown by itself again.
  final bool prompted;
}

/// Stores the nickname in shared preferences. Edited from the welcome
/// prompt and the Settings sheet; read by every celebration card.
class NicknameController extends Notifier<NicknameState> {
  static const _nameKey = 'user_nickname';
  static const _promptedKey = 'nickname_prompted';

  SharedPreferences? _prefs;

  @override
  NicknameState build() {
    try {
      _prefs = ref.watch(sharedPreferencesProvider);
    } catch (_) {
      // Isolated widget tests run without stored preferences.
      _prefs = null;
      return const NicknameState(prompted: true);
    }
    final prefs = _prefs!;
    return NicknameState(
      name: normalizeNickname(prefs.getString(_nameKey)),
      prompted: prefs.getBool(_promptedKey) ?? false,
    );
  }

  /// Saves [name] (blank clears it) and marks the prompt as answered.
  Future<void> save(String? name) async {
    final value = normalizeNickname(name);
    state = NicknameState(name: value, prompted: true);
    final prefs = _prefs;
    if (prefs == null) return;
    if (value == null) {
      await prefs.remove(_nameKey);
    } else {
      await prefs.setString(_nameKey, value);
    }
    await prefs.setBool(_promptedKey, true);
  }

  /// Dismisses the welcome prompt without a name.
  Future<void> skip() async {
    state = NicknameState(name: state.name, prompted: true);
    await _prefs?.setBool(_promptedKey, true);
  }
}

/// Trims [raw], collapses inner whitespace and caps the length; null when
/// nothing is left.
String? normalizeNickname(String? raw) {
  if (raw == null) return null;
  final value = raw.trim().replaceAll(RegExp(r'\s+'), ' ');
  if (value.isEmpty) return null;
  final chars = value.characters;
  return chars.length > kNicknameMaxLength
      ? chars.take(kNicknameMaxLength).toString().trim()
      : value;
}

final nicknameProvider = NotifierProvider<NicknameController, NicknameState>(
  NicknameController.new,
);
