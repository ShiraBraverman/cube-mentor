import '../../../core/cube/color_scheme.dart';
import '../../../core/cube/cube_state.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/l10n/move_words.dart';
import 'walkthrough.dart';

/// The color-specific sentence of [beat] ("Turn the top so the
/// white-green-orange corner sits right above its slot..."), with the
/// colors the user's cube shows ([scheme]). Empty when the beat has no cue.
String cueText(
  AppLocalizations l10n,
  WalkBeat beat, {
  CubeColorScheme scheme = CubeColorScheme.western,
}) {
  String color(StickerColor c) => colorName(l10n, c, scheme: scheme);
  String colors(List<StickerColor> list) =>
      list.map(color).join(l10n.pieceColorSeparator);
  final piece = colors(beat.piece);
  final sides = beat.sides;
  final a = sides.isEmpty ? '' : color(sides.first);
  final b = sides.length < 2 ? '' : color(sides[1]);
  final front = color(beat.front);
  final face = beat.face == null ? front : color(beat.face!);
  final pieceColor = beat.piece.isEmpty ? '' : color(beat.piece.first);
  return switch (beat.cue) {
    null => '',
    WalkCue.faceTurn => l10n.cueFaceTurn(face),
    WalkCue.trigger => l10n.cueTrigger(front),
    WalkCue.triggerBack => l10n.cueTriggerBack,
    WalkCue.sliceInner => l10n.cueSliceInner(face),
    WalkCue.sliceWide => l10n.cueSliceWide(face),
    WalkCue.turnCube => l10n.cueTurnCube(
      color(beat.nextTop),
      color(beat.nextFront),
    ),
    WalkCue.turnTop => l10n.cueTurnTop,
    WalkCue.alignTop => l10n.cueAlignTop,
    WalkCue.crossTop => l10n.cueCrossTop(piece, a),
    WalkCue.crossMiddle => l10n.cueCrossMiddle(piece, a),
    WalkCue.crossFlipped => l10n.cueCrossFlipped(piece, a),
    WalkCue.crossBottom => l10n.cueCrossBottom(piece, a),
    WalkCue.cornerTop => l10n.cueCornerTop(piece, a, b),
    WalkCue.cornerTwisted => l10n.cueCornerTwisted(piece),
    WalkCue.middleRight => l10n.cueMiddleRight(piece, a, b),
    WalkCue.middleLeft => l10n.cueMiddleLeft(piece, a, b),
    WalkCue.middleFlipped => l10n.cueMiddleFlipped(piece, a, b),
    WalkCue.yellowLine => l10n.cueYellowLine(front),
    WalkCue.yellowL => l10n.cueYellowL(front),
    WalkCue.yellowDot => l10n.cueYellowDot(front),
    WalkCue.edgesMatch => l10n.cueEdgesMatch(piece, a),
    WalkCue.edgesSwap => l10n.cueEdgesSwap(front),
    WalkCue.edgesOpposite => l10n.cueEdgesOpposite(front),
    WalkCue.cornersCycle => l10n.cueCornersCycle(
      colors(beat.frontRight),
      front,
    ),
    WalkCue.cornersNone => l10n.cueCornersNone(front),
    WalkCue.twistCorner => l10n.cueTwistCorner(colors(beat.frontRight)),
    WalkCue.twistFour => l10n.cueTwistFour(colors(beat.frontRight)),
    WalkCue.twistNext => l10n.cueTwistNext,
    WalkCue.f2lPair => l10n.cueF2lPair(piece, colors(beat.edge), a, b),
    WalkCue.f2lStuck => l10n.cueF2lStuck(piece),
    WalkCue.ollSune => l10n.cueOllSune(front),
    WalkCue.ollSuneAgain => l10n.cueOllSuneAgain(front),
    WalkCue.pllCorners => l10n.cuePllCorners(front),
    WalkCue.pllEdges => l10n.cuePllEdges(colors(beat.backEdge)),
    WalkCue.pllNoEdge => l10n.cuePllNoEdge,
    WalkCue.twoSwapAdjacent => l10n.cueTwoSwapAdjacent(front),
    WalkCue.twoSwapDiagonal => l10n.cueTwoSwapDiagonal(front),
    WalkCue.centerCycle => l10n.cueCenterCycle(pieceColor),
    WalkCue.centerBar => l10n.cueCenterBar(pieceColor),
    WalkCue.edgePair => l10n.cueEdgePair(piece),
    WalkCue.edgeLast => l10n.cueEdgeLast(piece),
    WalkCue.parityOll => l10n.cueParityOll(front),
    WalkCue.parityPll => l10n.cueParityPll,
    WalkCue.parityFive => l10n.cueParityFive(front),
    WalkCue.parityInnerWing => l10n.cueParityInnerWing(front),
  };
}
