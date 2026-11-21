import 'dart:convert';
import 'dart:io';

import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/settings/locale_controller.dart';
import 'package:flutter_test/flutter_test.dart';

/// The selector right before a plural branch body (a whole word, so
/// "Krone {crown}" is still an argument).
final _selector = RegExp(r'(^|[\s,{}])(=\d+|zero|one|two|few|many|other)\s*$');

/// Smoke test over the raw ARB files: every translation parses, carries
/// exactly the template's keys with the same placeholders, and is shipped.
void main() {
  final dir = Directory('lib/core/l10n');
  final files = {
    for (final file in dir.listSync().whereType<File>())
      if (file.path.endsWith('.arb'))
        RegExp(r'app_(\w+)\.arb$').firstMatch(file.path)!.group(1)!: file,
  };

  Map<String, dynamic> read(String tag) =>
      jsonDecode(files[tag]!.readAsStringSync()) as Map<String, dynamic>;

  Iterable<String> messageKeys(Map<String, dynamic> arb) =>
      arb.keys.where((k) => !k.startsWith('@'));

  /// Argument names used by an ICU message: `{name}` and `{name, plural, ...}`.
  Set<String> argumentsOf(String message) {
    final names = <String>{};
    var depth = 0;
    for (var i = 0; i < message.length; i++) {
      final char = message[i];
      if (char == '{') {
        // A plural branch body follows its selector (`=1{`, `other{`);
        // any other brace opens an argument: an identifier, then `}` or `,`.
        final isBranch = _selector.hasMatch(message.substring(0, i));
        final match = RegExp(r'^\{\s*([A-Za-z_]\w*)\s*[,}]')
            .matchAsPrefix(message.substring(i));
        if (!isBranch && match != null) names.add(match.group(1)!);
        depth++;
      } else if (char == '}') {
        depth--;
      }
    }
    expect(depth, 0, reason: 'unbalanced braces in "$message"');
    return names;
  }

  final template = read('en');
  final templateKeys = messageKeys(template).toSet();

  test('the template defines metadata for every placeholder', () {
    for (final key in templateKeys) {
      final args = argumentsOf(template[key] as String);
      if (args.isEmpty) continue;
      final meta = template['@$key'] as Map<String, dynamic>?;
      final placeholders = (meta?['placeholders'] as Map<String, dynamic>?)
          ?.keys
          .toSet();
      expect(placeholders, args, reason: key);
    }
  });

  test('every shipped language has an ARB file and vice versa', () {
    expect(files.keys.toSet(), {
      for (final language in kAppLanguages) language.tag,
    });
  });

  for (final tag in files.keys.where((t) => t != 'en')) {
    test('$tag.arb matches the English template', () {
      final arb = read(tag);
      expect(arb['@@locale'], tag);
      final keys = messageKeys(arb).toSet();
      expect(
        templateKeys.difference(keys),
        isEmpty,
        reason: 'untranslated in $tag',
      );
      expect(keys.difference(templateKeys), isEmpty, reason: 'unknown in $tag');
      for (final key in templateKeys) {
        final message = arb[key];
        expect(message, isA<String>(), reason: '$tag $key');
        expect((message as String).trim(), isNotEmpty, reason: '$tag $key');
        expect(
          argumentsOf(message),
          argumentsOf(template[key] as String),
          reason: '$tag $key',
        );
      }
    });
  }

  test('every ARB locale compiles into the generated localizations', () {
    for (final language in kAppLanguages) {
      final l10n = lookupAppLocalizations(language.locale);
      expect(l10n.localeName, language.tag);
      expect(l10n.settingsColorScheme, isNotEmpty);
    }
  });
}
