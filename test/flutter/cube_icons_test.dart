import 'package:cube_mentor/shared/widgets/cube_icons/cube_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

typedef _IconFactory = AnimatedCubeIcon Function({
  Key? key,
  double size,
  bool animate,
  String? semanticLabel,
});

const Map<String, _IconFactory> _icons = {
  'scramble': AnimatedScrambleCubeIcon.new,
  'solve': AnimatedSolveCubeIcon.new,
  'scanner': AnimatedScannerCubeIcon.new,
  'pattern': AnimatedPatternCubeIcon.new,
  'academy': AnimatedAcademyCubeIcon.new,
  'timer': AnimatedTimerCubeIcon.new,
  'streak': AnimatedStreakStepIcon.new,
  'hint': AnimatedHintCubeIcon.new,
};

Widget _host(
  Widget child, {
  TextDirection direction = TextDirection.ltr,
  bool reduceMotion = false,
}) => MediaQuery(
  data: MediaQueryData(disableAnimations: reduceMotion),
  child: Directionality(
    textDirection: direction,
    child: Center(child: child),
  ),
);

void main() {
  for (final MapEntry(key: name, value: make) in _icons.entries) {
    group(name, () {
      for (final size in [22.0, 28.0, 48.0]) {
        testWidgets('paints a full loop at ${size.toInt()} px', (tester) async {
          await tester.pumpWidget(_host(make(size: size)));
          expect(
            tester.getSize(find.byType(CustomPaint).last),
            Size.square(size),
          );
          // Step through more than one loop: every phase must paint.
          for (var i = 0; i < 40; i++) {
            await tester.pump(const Duration(milliseconds: 130));
          }
          expect(tester.takeException(), isNull);
        });
      }

      testWidgets('loops only while it animates and is visible', (
        tester,
      ) async {
        await tester.pumpWidget(_host(make()));
        await tester.pump(const Duration(milliseconds: 16));
        expect(tester.binding.hasScheduledFrame, isTrue);

        await tester.pumpWidget(_host(make(animate: false)));
        await tester.pump(const Duration(milliseconds: 16));
        expect(tester.binding.hasScheduledFrame, isFalse);

        await tester.pumpWidget(
          _host(TickerMode(enabled: false, child: make())),
        );
        await tester.pump(const Duration(milliseconds: 16));
        expect(tester.binding.hasScheduledFrame, isFalse);

        await tester.pumpWidget(_host(make(), reduceMotion: true));
        await tester.pump(const Duration(milliseconds: 16));
        expect(tester.binding.hasScheduledFrame, isFalse);

        // Removing it disposes its controller without errors.
        await tester.pumpWidget(_host(const SizedBox()));
        expect(tester.takeException(), isNull);
      });

      testWidgets('paints right to left', (tester) async {
        await tester.pumpWidget(
          _host(make(size: 48), direction: TextDirection.rtl),
        );
        await tester.pump(const Duration(seconds: 1));
        expect(tester.takeException(), isNull);
      });
    });
  }

  testWidgets('a tile makes the icon fill its inner area', (tester) async {
    await tester.pumpWidget(
      _host(
        const CubeIconTile(size: 60, child: AnimatedTimerCubeIcon(size: 10)),
      ),
    );
    expect(
      tester.getSize(find.byType(CustomPaint).last),
      const Size(46, 46),
    ); // 60 - 2 x 6 padding - 2 x 1 border.
  });

  testWidgets('a semantic label is exposed only when given', (tester) async {
    await tester.pumpWidget(
      _host(const AnimatedHintCubeIcon(semanticLabel: 'Hint')),
    );
    expect(find.bySemanticsLabel('Hint'), findsOneWidget);
  });

  testWidgets('a covered route pauses its icons', (tester) async {
    final navigator = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigator,
        home: const Scaffold(body: AnimatedScrambleCubeIcon()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 16));
    expect(tester.binding.hasScheduledFrame, isTrue);

    navigator.currentState!.push(
      PageRouteBuilder<void>(
        transitionDuration: Duration.zero,
        pageBuilder: (_, _, _) => const ColoredBox(color: Colors.black),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(tester.binding.hasScheduledFrame, isFalse);
  });
}
