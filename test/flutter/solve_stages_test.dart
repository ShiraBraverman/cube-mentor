import 'package:cube_mentor/core/l10n/generated/app_localizations.dart';
import 'package:cube_mentor/core/solver/solve_stages.dart';
import 'package:cube_mentor/core/solver/solve_step.dart';
import 'package:cube_mentor/features/solver_3d/widgets/stage_header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

SolveStep _step(String phase, {int crown = 0, int subStep = 0}) => SolveStep(
  cubeState: '',
  phaseName: phase,
  moveNotation: 'R',
  explanationKey: 'x',
  crown: crown,
  subStep: subStep,
);

List<SolveStep> _times(int n, SolveStep step) => List.filled(n, step);

void main() {
  late AppLocalizations en;
  setUpAll(() async {
    en = await AppLocalizations.delegate.load(const Locale('en'));
  });

  test('3x3 guided: the seven sub-steps are the stages', () {
    final steps = [
      ..._times(4, _step('lblCross', crown: 1, subStep: 1)),
      ..._times(8, _step('lblCorners', crown: 1, subStep: 2)),
      ..._times(2, _step('lblYellowCross', crown: 3, subStep: 1)),
    ];
    final plan = StagePlan.of(steps, 3);
    final first = plan.stageAt(0)!;
    expect((first.number, first.total), (1, 7));
    // Numbered like the Academy lesson for the same sub-step.
    expect(stageHeadline(en, first), '1.1 White cross');
    final corners = plan.stageAt(6)!;
    expect((corners.number, corners.first, corners.last), (2, 4, 11));
    // Progress runs within the stage only.
    expect(corners.progressAt(4), 0);
    expect(corners.progressAt(8), 0.5);
    // A skipped sub-step (2.1 here) keeps the numbering stable.
    expect(plan.stageAt(13)!.number, 4);
  });

  test('big cubes: reduction stages, then the three crowns', () {
    final steps = [
      ..._times(120, _step('reductionCenters')),
      ..._times(90, _step('reductionEdgeParity')),
      ..._times(200, _step('reductionEdges')),
      ..._times(18, _step('reductionOllParity')),
      ..._times(10, _step('lblCross', crown: 1, subStep: 1)),
      ..._times(20, _step('lblCorners', crown: 1, subStep: 2)),
      ..._times(30, _step('lblMiddle', crown: 2, subStep: 1)),
      ..._times(40, _step('lblYellowEdges', crown: 3, subStep: 2)),
    ];
    final plan = StagePlan.of(steps, 4);
    String headline(int i) => stageHeadline(en, plan.stageAt(i)!);
    expect(headline(0), 'Stage 1 of 6: Build center blocks');
    expect(headline(150), 'Stage 2 of 6: Pair outer & inner edges');
    expect(headline(420), 'Stage 3 of 6: Parity resolution');
    expect(headline(430), 'Stage 4 of 6: First crown (white)');
    expect(headline(470), 'Stage 5 of 6: Second crown');
    expect(headline(500), 'Stage 6 of 6: Third crown (yellow)');
    // Pairing (with its slice parity) is one stage: 290 moves.
    final edges = plan.stageAt(150)!;
    expect((edges.first, edges.last), (120, 409));

    // Odd cubes never have OLL/PLL parity: five stages.
    final odd = StagePlan.of([
      _step('reductionCenters'),
      _step('reductionEdges'),
      _step('lblCross', crown: 1, subStep: 1),
    ], 5);
    expect(
      stageHeadline(en, odd.stageAt(2)!),
      'Stage 3 of 5: First crown (white)',
    );
  });

  test('fast solves, the 2x2 and scripted guides', () {
    final fast = StagePlan.of([
      _step('kociembaPhase1'),
      _step('kociembaPhase2'),
    ], 3);
    expect(
      stageHeadline(en, fast.stageAt(1)!),
      'Stage 2 of 2: Finish the cube',
    );
    final bigFast = StagePlan.of([
      _step('reductionCenters'),
      _step('kociembaPhase1'),
      _step('kociembaPhase2'),
    ], 6);
    expect(
      stageHeadline(en, bigFast.stageAt(2)!),
      'Stage 4 of 4: Solve as a 3×3',
    );
    final two = StagePlan.of([_step('optimal2x2')], 2);
    expect(stageHeadline(en, two.stageAt(0)!), 'Stage 1 of 1: Solve the 2×2');
    // Patterns, lessons and scramble guides have no stages.
    expect(StagePlan.of([_step('pattern')], 3).isEmpty, isTrue);
  });

  test('the cache keeps sizes apart for the same steps', () {
    final steps = List<SolveStep>.unmodifiable([
      _step('lblCross', crown: 1, subStep: 1),
    ]);
    expect(StagePlan.forSteps(steps, 3).stageAt(0)!.total, 7);
    expect(StagePlan.forSteps(steps, 4).stageAt(0)!.total, 6);
    expect(StagePlan.forSteps(steps, 5).stageAt(0)!.total, 5);
    expect(
      identical(StagePlan.forSteps(steps, 3), StagePlan.forSteps(steps, 3)),
      isTrue,
    );
  });

  test('2x2 guided: bottom layer, top color, finish', () {
    final plan = StagePlan.of([
      ..._times(5, _step('twoFirstLayer')),
      ..._times(6, _step('twoTopColor')),
      ..._times(4, _step('twoFinish')),
    ], 2);
    String headline(int i) => stageHeadline(en, plan.stageAt(i)!);
    expect(headline(0), 'Stage 1 of 3: Build the bottom layer');
    expect(headline(7), 'Stage 2 of 3: Make the top one color');
    expect(headline(14), 'Stage 3 of 3: Finish the corners');
  });
}
