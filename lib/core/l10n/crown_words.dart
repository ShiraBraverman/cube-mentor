import 'generated/app_localizations.dart';

/// Number of layers (stages) of the beginner's layer-by-layer method.
/// Identifiers keep the historical name "crown"; user-visible text says
/// "layer" in every language except French ("couronne").
const int kCrowns = 3;

/// The seven sub-steps of the beginner's method in order: solver phase key,
/// crown (1..3) and sub-step within the crown (1.1, 1.2, 2.1, 3.1 .. 3.4).
/// The native solver tags its steps the same way (`kLblStages` in C++).
const List<({String phase, int crown, int subStep})> kLblSubSteps = [
  (phase: 'lblCross', crown: 1, subStep: 1),
  (phase: 'lblCorners', crown: 1, subStep: 2),
  (phase: 'lblMiddle', crown: 2, subStep: 1),
  (phase: 'lblYellowCross', crown: 3, subStep: 1),
  (phase: 'lblYellowEdges', crown: 3, subStep: 2),
  (phase: 'lblYellowCorners', crown: 3, subStep: 3),
  (phase: 'lblYellowCornersOrient', crown: 3, subStep: 4),
];

/// Localized name of crown [crown] (1..3).
String crownName(AppLocalizations l10n, int crown) => switch (crown) {
  1 => l10n.crownFirst,
  2 => l10n.crownSecond,
  _ => l10n.crownThird,
};

/// Localized one-line goal of crown [crown].
String crownGoal(AppLocalizations l10n, int crown) => switch (crown) {
  1 => l10n.crownFirstGoal,
  2 => l10n.crownSecondGoal,
  _ => l10n.crownThirdGoal,
};

/// Title of a sub-step, shared by the guided solve banner and the Academy.
String subStepTitle(AppLocalizations l10n, int crown, int subStep) =>
    switch ((crown, subStep)) {
      (1, 1) => l10n.phaseLblCross,
      (1, 2) => l10n.phaseLblCorners,
      (2, 1) => l10n.phaseLblMiddle,
      (3, 1) => l10n.phaseLblYellowCross,
      (3, 2) => l10n.phaseLblYellowEdges,
      (3, 3) => l10n.phaseLblYellowCorners,
      _ => l10n.phaseLblYellowCornersOrient,
    };

/// What a sub-step achieves, in one beginner-friendly sentence.
String subStepGoal(AppLocalizations l10n, int crown, int subStep) =>
    switch ((crown, subStep)) {
      (1, 1) => l10n.subStepGoal11,
      (1, 2) => l10n.subStepGoal12,
      (2, 1) => l10n.subStepGoal21,
      (3, 1) => l10n.subStepGoal31,
      (3, 2) => l10n.subStepGoal32,
      (3, 3) => l10n.subStepGoal33,
      _ => l10n.subStepGoal34,
    };
