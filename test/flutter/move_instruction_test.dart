import 'package:cube_mentor/core/cube/cube_move.dart';
import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/l10n/move_words.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  late AppLocalizations en;
  late AppLocalizations he;

  setUpAll(() async {
    en = await AppLocalizations.delegate.load(const Locale('en'));
    he = await AppLocalizations.delegate.load(const Locale('he'));
  });

  (String, MoveArrow, bool) say(String token, {int size = 3}) {
    final i = moveInstruction(en, MoveNotation.parse(token, size), size);
    return (i.text(en), i.arrow, i.half);
  }

  test('outer turns name the row or column of the front face', () {
    expect(say('R'), (
      'Right column of the front face — Up',
      MoveArrow.up,
      false,
    ));
    expect(say("R'"), (
      'Right column of the front face — Down',
      MoveArrow.down,
      false,
    ));
    expect(say('L'), (
      'Left column of the front face — Down',
      MoveArrow.down,
      false,
    ));
    expect(say('U'), (
      'Top row of the front face — Left',
      MoveArrow.left,
      false,
    ));
    expect(say("U'"), (
      'Top row of the front face — Right',
      MoveArrow.right,
      false,
    ));
    expect(say('D'), (
      'Bottom row of the front face — Right',
      MoveArrow.right,
      false,
    ));
    expect(say('F'), ('Front face — Clockwise', MoveArrow.clockwise, false));
    expect(say("F'"), (
      'Front face — Counter-clockwise',
      MoveArrow.counterClockwise,
      false,
    ));
    // Clockwise for the back face looks counter-clockwise from the front.
    expect(say('B'), (
      'Back face — Clockwise, seen from behind',
      MoveArrow.counterClockwise,
      false,
    ));
  });

  test('double turns, slices and whole-cube turns', () {
    expect(say('F2'), (
      'Front face — Double turn (180°)',
      MoveArrow.clockwise,
      true,
    ));
    expect(say('U2').$3, isTrue);
    expect(say('M'), ('Middle slice — Down', MoveArrow.down, false));
    expect(say('x'), ('Whole cube — Up', MoveArrow.up, false));
    expect(say('y'), ('Whole cube — Left', MoveArrow.left, false));
  });

  test('big-cube layers say how deep', () {
    expect(say('Rw', size: 4).$1, 'Right side, 2 layers deep — Up');
    expect(say('2R', size: 4).$1, 'Right side, layer 2 — Up');
    expect(say("Uw'", size: 5).$1, 'Top row, 2 layers deep — Right');
  });

  test('Hebrew reads naturally', () {
    String sayHe(String token) =>
        moveInstruction(he, MoveNotation.parse(token, 3), 3).text(he);
    expect(sayHe('R'), 'העמודה הימנית של הפאה הקדמית — למעלה');
    expect(sayHe('U'), 'השורה העליונה של הפאה הקדמית — שמאלה');
    expect(sayHe('F'), 'פאה קדמית — עם כיוון השעון');
    expect(sayHe('R2'), 'העמודה הימנית של הפאה הקדמית — סיבוב כפול (180°)');
  });
}
