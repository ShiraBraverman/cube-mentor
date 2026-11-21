import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads/ad_config.dart';
import '../../core/ads/reward_gate.dart';
import '../../core/ads/reward_prompt.dart';
import '../../core/cube/cube_state.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../../core/theme/ui_kit.dart';
import '../home/home_controller.dart';
import '../solver_3d/model/guide_script.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../solver_3d/widgets/cube_preview.dart';
import 'patterns.dart';

/// Gallery of classic patterns, one page per cube size: tap a size chip or
/// swipe sideways anywhere to switch. Opening one plays it on the 3D cube
/// step by step (follow along on a real cube), and the Solve button brings
/// it back to normal.
///
/// The 2x2 and 3x3 pages and the first pattern of each 4x4-6x6 page are
/// free; the rest open for 20 minutes per rewarded video. A countdown pill
/// shows the time left, and when it runs out while the library is open a
/// friendly sheet offers another 20 minutes.
class PatternsScreen extends ConsumerStatefulWidget {
  /// Always opens on the 3x3, the size most people own.
  const PatternsScreen({super.key, this.initialSize = 3});

  final int initialSize;

  @override
  ConsumerState<PatternsScreen> createState() => _PatternsScreenState();
}

class _PatternsScreenState extends ConsumerState<PatternsScreen> {
  static const _pageDuration = Duration(milliseconds: 300);

  late int _page = max(0, kCubeSizes.indexOf(widget.initialSize));
  late final PageController _pages = PageController(initialPage: _page);

  /// Ticks once a second while the timed unlock runs (or while its expiry
  /// still has to be announced).
  Timer? _ticker;

  /// Whether the countdown was running at the last tick.
  bool _counting = false;

  /// The timed unlock ran out and the user has not been told yet (they may
  /// be looking at a pattern; the sheet waits until they are back here).
  bool _expiryPending = false;

  bool _sheetOpen = false;

  AdMobRewardGate get _gate => ref.read(rewardGateProvider.notifier);

  @override
  void initState() {
    super.initState();
    _counting = _gate.patternsTimeLeft() != null;
    _syncTicker();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _pages.dispose();
    super.dispose();
  }

  void _syncTicker() {
    final running = _counting || _expiryPending;
    if (running && _ticker == null) {
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    } else if (!running && _ticker != null) {
      _ticker!.cancel();
      _ticker = null;
    }
  }

  void _tick() {
    if (!mounted) return;
    final counting = _gate.patternsTimeLeft() != null;
    if (_counting && !counting) _expiryPending = true;
    setState(() => _counting = counting);
    if (_expiryPending &&
        !_sheetOpen &&
        (ModalRoute.of(context)?.isCurrent ?? true)) {
      _expiryPending = false;
      _promptUnlock(expired: true);
    }
    _syncTicker();
  }

  /// "Watch 1 short video to unlock all patterns for 20 minutes", or, once
  /// the time is up ([expired]), the offer to keep them for another 20.
  Future<void> _promptUnlock({required bool expired}) async {
    _sheetOpen = true;
    final watch = await showPatternsUnlockSheet(context, expired: expired);
    _sheetOpen = false;
    if (watch == true && mounted) await _unlock();
  }

  Future<void> _unlock() async {
    await unlockWithFeedback(context, ref, RewardFeature.bigCubePatterns);
    if (!mounted) return;
    setState(() => _counting = _gate.patternsTimeLeft() != null);
    _syncTicker();
  }

  void _goTo(int page) {
    if (page < 0 || page >= kCubeSizes.length) return;
    setState(() => _page = page);
    _pages.animateToPage(
      page,
      duration: _pageDuration,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    // Rebuild when an unlock is granted.
    ref.watch(rewardGateProvider);
    final unlocked = _gate.isUnlocked(RewardFeature.bigCubePatterns);
    final timeLeft = _gate.patternsTimeLeft();
    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.patternsTitle)),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // The header swipes too, so a sideways swipe anywhere on
                  // the screen changes the size.
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onHorizontalDragEnd: (details) {
                      final v = details.primaryVelocity ?? 0;
                      if (v.abs() < 200) return;
                      // Swiping toward the reading start shows the next size.
                      final forward = rtl ? v > 0 : v < 0;
                      _goTo(_page + (forward ? 1 : -1));
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        AppSpace.gutter,
                        AppSpace.xxs,
                        AppSpace.gutter,
                        AppSpace.md,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (timeLeft != null) ...[
                            AppPill(
                              key: const ValueKey('patterns-countdown'),
                              label: l10n.patternsUnlockedLeft(
                                formatUnlockTime(timeLeft),
                              ),
                              icon: Icons.lock_open_rounded,
                              color: AppColors.accentSecondary,
                            ),
                            const SizedBox(height: AppSpace.sm),
                          ],
                          Text(
                            l10n.patternsHint,
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppSpace.md),
                          Wrap(
                            spacing: AppSpace.xs,
                            runSpacing: AppSpace.xs,
                            children: [
                              for (final (i, size) in kCubeSizes.indexed)
                                ChoiceChip(
                                  key: ValueKey('patterns-size-$size'),
                                  label: Text(l10n.cubeSizeLabel(size)),
                                  selected: i == _page,
                                  onSelected: (_) => _goTo(i),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      key: const ValueKey('patterns-pages'),
                      controller: _pages,
                      itemCount: kCubeSizes.length,
                      onPageChanged: (page) => setState(() => _page = page),
                      itemBuilder: (context, i) => _PatternGrid(
                        size: kCubeSizes[i],
                        unlocked: unlocked,
                        onUnlock: _unlock,
                        onLockedTap: () => _promptUnlock(expired: false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The patterns of one cube size. On a locked 4x4-6x6 page an unlock
/// banner leads, and the gated patterns show dimmed with a video badge.
class _PatternGrid extends StatelessWidget {
  const _PatternGrid({
    required this.size,
    required this.unlocked,
    required this.onUnlock,
    required this.onLockedTap,
  });

  final int size;

  /// The timed unlock is running (or not needed on this platform).
  final bool unlocked;
  final VoidCallback onUnlock;
  final VoidCallback onLockedTap;

  @override
  Widget build(BuildContext context) {
    final patterns = [
      for (final p in kPatterns)
        if (p.supports(size)) p,
    ];
    final gated =
        !unlocked &&
        Iterable<int>.generate(patterns.length)
            .any((i) => patternNeedsUnlock(size, i));
    return CustomScrollView(
      key: PageStorageKey('patterns-grid-$size'),
      slivers: [
        if (gated)
          SliverPadding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppSpace.gutter,
              0,
              AppSpace.gutter,
              AppSpace.xxs,
            ),
            sliver: SliverToBoxAdapter(
              child: _UnlockBanner(size: size, onUnlock: onUnlock),
            ),
          ),
        SliverPadding(
          padding: kPagePadding,
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisSpacing: AppSpace.sm,
              crossAxisSpacing: AppSpace.sm,
              childAspectRatio: 0.82,
            ),
            itemCount: patterns.length,
            itemBuilder: (context, i) => _PatternCard(
              pattern: patterns[i],
              size: size,
              locked: !unlocked && patternNeedsUnlock(size, i),
              // The always-free sample of a locked big-cube page.
              freeSample: gated && !patternNeedsUnlock(size, i),
              onLockedTap: onLockedTap,
            ),
          ),
        ),
      ],
    );
  }
}

/// "Watch 1 short video to unlock all patterns for 20 minutes".
class _UnlockBanner extends StatelessWidget {
  const _UnlockBanner({required this.size, required this.onUnlock});

  final int size;
  final VoidCallback onUnlock;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      key: ValueKey('patterns-unlock-banner-$size'),
      selected: true,
      accent: AppColors.gold,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.sm,
        AppSpace.sm,
        AppSpace.sm,
      ),
      child: Row(
        children: [
          const Icon(Icons.ondemand_video_rounded, color: AppColors.gold),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Text(
              l10n.patternsUnlockPrompt(
                AdConfig.patternsUnlockDuration.inMinutes,
              ),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 132),
            child: FilledButton(
              key: ValueKey('patterns-unlock-$size'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.gold,
                foregroundColor: AppColors.onAccent,
                padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm),
                visualDensity: VisualDensity.compact,
              ),
              onPressed: onUnlock,
              child: Text(
                l10n.patternsWatchVideo,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PatternCard extends StatelessWidget {
  const _PatternCard({
    required this.pattern,
    required this.size,
    required this.locked,
    required this.freeSample,
    required this.onLockedTap,
  });

  final CubePattern pattern;
  final int size;

  /// Needs the timed unlock: dimmed, and tapping offers the video.
  final bool locked;

  /// The always-free pattern of a locked big-cube page.
  final bool freeSample;
  final VoidCallback onLockedTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final moves = pattern.movesFor(size);
    final name = patternName(l10n, pattern.id);
    return GlassCard(
      key: ValueKey('pattern-${pattern.id}'),
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.sm,
        AppSpace.sm,
        AppSpace.sm,
        AppSpace.md,
      ),
      onTap: locked
          ? onLockedTap
          : () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => Solver3DScreen(
                  size: size,
                  title: l10n.patternTitle(name, size),
                  guide: GuideScript(
                    start: CubeState.solved(size),
                    moves: moves,
                    phase: 'pattern',
                    explanation: 'patternStep',
                  ),
                ),
              ),
            ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: locked ? 0.35 : 1,
                    child: CubePreview(
                      size: size,
                      cube: pattern.stateFor(size),
                    ),
                  ),
                ),
                if (locked)
                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    child: Container(
                      key: ValueKey('pattern-${pattern.id}-locked'),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.gold.withValues(alpha: 0.18),
                        border: Border.all(
                          color: AppColors.gold.withValues(alpha: 0.6),
                        ),
                      ),
                      child: const Icon(
                        Icons.lock_rounded,
                        size: 16,
                        color: AppColors.gold,
                      ),
                    ),
                  )
                else if (freeSample)
                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: AppPill(
                        key: ValueKey('pattern-${pattern.id}-free'),
                        label: l10n.patternsFreeSample,
                        color: AppColors.accentSecondary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            name,
            style: textTheme.titleSmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            l10n.solveSummary(moves.length),
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

/// "19:42": minutes and seconds left, rounded up so a fresh unlock reads
/// "20:00".
String formatUnlockTime(Duration left) {
  final seconds = (left.inMilliseconds + 999) ~/ 1000;
  final minutes = seconds ~/ 60;
  final rest = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$rest';
}

/// Bottom sheet offering one rewarded video for 20 minutes of every
/// pattern: on a locked pattern, or ([expired]) right when the timed unlock
/// ran out. Resolves to true when the user chose "Watch Video".
Future<bool?> showPatternsUnlockSheet(
  BuildContext context, {
  required bool expired,
}) => showModalBottomSheet<bool>(
  context: context,
  backgroundColor: Colors.transparent,
  isScrollControlled: true,
  builder: (sheetContext) => PatternsUnlockSheet(expired: expired),
);

/// Content of [showPatternsUnlockSheet].
class PatternsUnlockSheet extends StatelessWidget {
  const PatternsUnlockSheet({super.key, required this.expired});

  final bool expired;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final minutes = AdConfig.patternsUnlockDuration.inMinutes;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
        child: GlassCard(
          key: ValueKey(
            expired ? 'patterns-expired-sheet' : 'patterns-unlock-sheet',
          ),
          blur: 28,
          selected: true,
          accent: AppColors.gold,
          borderRadius: AppRadius.lg,
          padding: const EdgeInsetsDirectional.fromSTEB(
            AppSpace.gutter,
            AppSpace.lg,
            AppSpace.gutter,
            AppSpace.sm,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: AccentIcon(
                    icon: expired
                        ? Icons.hourglass_bottom_rounded
                        : Icons.lock_open_rounded,
                    color: AppColors.gold,
                    size: 52,
                  ),
                ),
                const SizedBox(height: AppSpace.md),
                Text(
                  expired
                      ? l10n.patternsExpiredTitle
                      : l10n.patternsUnlockTitle,
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  expired
                      ? l10n.patternsExpiredBody(minutes)
                      : l10n.patternsUnlockPrompt(minutes),
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpace.lg),
                FilledButton.icon(
                  key: const ValueKey('patterns-sheet-watch'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.onAccent,
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  icon: const Icon(Icons.ondemand_video_rounded),
                  label: Text(l10n.patternsWatchVideo),
                ),
                const SizedBox(height: AppSpace.xxs),
                TextButton(
                  key: const ValueKey('patterns-sheet-not-now'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(l10n.patternsNotNow),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
