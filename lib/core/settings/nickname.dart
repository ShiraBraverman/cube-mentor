import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preferences.dart';

/// Longest nickname kept (characters); longer input is cut.
const int kNicknameMaxLength = 24;

/// The user's nickname, set from Settings.
@immutable
class NicknameState {
  const NicknameState({this.name});

  /// What celebrations call the user; null when none was given.
  final String? name;
}

/// Stores the nickname in shared preferences. Edited from the Settings
/// sheet; read by every celebration card.
class NicknameController extends Notifier<NicknameState> {
  static const _nameKey = 'user_nickname';

  SharedPreferences? _prefs;

  @override
  NicknameState build() {
    try {
      _prefs = ref.watch(sharedPreferencesProvider);
    } catch (_) {
      // Isolated widget tests run without stored preferences.
      _prefs = null;
      return const NicknameState();
    }
    return NicknameState(name: normalizeNickname(_prefs!.getString(_nameKey)));
  }

  /// Saves [name]; a blank one clears it.
  Future<void> save(String? name) async {
    final value = normalizeNickname(name);
    state = NicknameState(name: value);
    final prefs = _prefs;
    if (prefs == null) return;
    if (value == null) {
      await prefs.remove(_nameKey);
    } else {
      await prefs.setString(_nameKey, value);
    }
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
