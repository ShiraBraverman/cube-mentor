import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/settings/clock.dart';
import '../../../core/settings/nickname.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass.dart';
import '../../../core/theme/ui_kit.dart';
import '../../timer/model/timer_stats.dart';
import '../daily_controller.dart';
import 'daily_leaderboard.dart';

/// Height of one leaderboard row; fixed so the user's row can be centered
/// without laying out the thousands of rows above it.
const double kLeaderboardRowExtent = 56;

/// "4,820" in the app language (Latin digits where intl lacks the locale).
String formatCount(AppLocalizations l10n, int value) {
  final locale = NumberFormat.localeExists(l10n.localeName)
      ? l10n.localeName
      : 'en';
  return NumberFormat.decimalPattern(locale).format(value);
}

/// Today's board at the current clock, refreshed every minute while shown
/// so new rivals keep joining.
mixin LiveLeaderboard<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  Timer? _tick;

  @override
  void initState() {
    super.initState();
    _tick = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  DailyLeaderboard watchLeaderboard() {
    final daily = ref.watch(dailyProvider);
    final now = ref.watch(clockProvider)();
    return DailyLeaderboard.cached(
      dayKey: dayKey(daily.date),
      now: now,
      userMillis: daily.doneToday ? daily.todayMillis : null,
    );
  }
}

/// The daily challenge's ranked list: thousands of simulated rivals plus
/// the user's real time, opened centered on the user's row.
class DailyLeaderboardScreen extends ConsumerStatefulWidget {
  const DailyLeaderboardScreen({super.key});

  @override
  ConsumerState<DailyLeaderboardScreen> createState() =>
      _DailyLeaderboardScreenState();
}

class _DailyLeaderboardScreenState extends ConsumerState<DailyLeaderboardScreen>
    with LiveLeaderboard {
  ScrollController? _scroll;

  @override
  void dispose() {
    _scroll?.dispose();
    super.dispose();
  }

  double _offsetFor(DailyLeaderboard board, double viewport) =>
      board.userIndex == null
      ? 0
      : centeredOffset(
          index: board.userIndex!,
          rowExtent: kLeaderboardRowExtent,
          viewport: viewport,
          rowCount: board.total,
        );

  void _jumpToMe(DailyLeaderboard board) {
    final scroll = _scroll;
    if (scroll == null || !scroll.hasClients) return;
    scroll.animateTo(
      _offsetFor(board, scroll.position.viewportDimension),
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final board = watchLeaderboard();
    final name =
        ref.watch(nicknameProvider.select((n) => n.name)) ??
        l10n.leaderboardYou;
    final rank = board.userRank;

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.leaderboardTitle),
          actions: [
            if (rank != null)
              IconButton(
                key: const ValueKey('leaderboard-jump'),
                tooltip: l10n.leaderboardJumpToMe,
                onPressed: () => _jumpToMe(board),
                icon: const Icon(Icons.my_location_rounded),
              ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: PageFrame(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    AppSpace.gutter,
                    AppSpace.xs,
                    AppSpace.gutter,
                    AppSpace.sm,
                  ),
                  child: GlassCard(
                    selected: rank != null,
                    accent: AppColors.gold,
                    child: Row(
                      children: [
                        AccentIcon(
                          icon: Icons.emoji_events_rounded,
                          color: rank != null
                              ? AppColors.gold
                              : AppColors.textTertiary,
                          size: 52,
                          glow: rank != null,
                        ),
                        const SizedBox(width: AppSpace.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (rank != null) ...[
                                Text(
                                  l10n.leaderboardRankOf(
                                    formatCount(l10n, rank),
                                    formatCount(l10n, board.total),
                                  ),
                                  key: const ValueKey('leaderboard-rank'),
                                  style: textTheme.headlineSmall?.copyWith(
                                    color: AppColors.gold,
                                  ),
                                ),
                                Text(
                                  l10n.leaderboardYourTime(
                                    formatTime(board.userMillis),
                                  ),
                                  style: textTheme.bodyMedium,
                                ),
                              ] else
                                Text(
                                  l10n.leaderboardNotRanked,
                                  key: const ValueKey('leaderboard-unranked'),
                                  style: textTheme.titleSmall,
                                ),
                              const SizedBox(height: 2),
                              Text(
                                '${l10n.leaderboardSolvedToday(board.rivalCount, formatCount(l10n, board.rivalCount))}'
                                ' • ${l10n.leaderboardAvgTime(formatTime(board.averageMillis))}',
                                key: const ValueKey('leaderboard-field'),
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Opens centered on the user's row; later rebuilds
                      // (new rivals joining) keep the reader's position.
                      _scroll ??= ScrollController(
                        initialScrollOffset: _offsetFor(
                          board,
                          constraints.maxHeight,
                        ),
                      );
                      return Scrollbar(
                        controller: _scroll,
                        interactive: true,
                        child: ListView.builder(
                          key: const ValueKey('leaderboard-list'),
                          controller: _scroll,
                          itemExtent: kLeaderboardRowExtent,
                          padding: EdgeInsets.zero,
                          itemCount: board.total,
                          itemBuilder: (context, i) {
                            final entry = board.entries[i];
                            return _LeaderboardRow(
                              key: entry.isUser
                                  ? const ValueKey('leaderboard-me')
                                  : null,
                              rank: formatCount(l10n, i + 1),
                              place: i + 1,
                              name: entry.isUser ? name : board.nameOf(entry),
                              time: formatTime(entry.millis),
                              isUser: entry.isUser,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    AppSpace.gutter,
                    AppSpace.xs,
                    AppSpace.gutter,
                    AppSpace.xs,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        size: 14,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: AppSpace.xxs),
                      Expanded(
                        child: Text(
                          l10n.leaderboardSimulated,
                          key: const ValueKey('leaderboard-disclosure'),
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LeaderboardRow extends StatelessWidget {
  const _LeaderboardRow({
    super.key,
    required this.rank,
    required this.place,
    required this.name,
    required this.time,
    required this.isUser,
  });

  final String rank;
  final int place;
  final String name;
  final String time;
  final bool isUser;

  static const _podium = [AppColors.gold, Color(0xFFC9D2E3), Color(0xFFE0975A)];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final medal = place <= 3 ? _podium[place - 1] : null;
    final ink = isUser ? AppColors.textPrimary : AppColors.textSecondary;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.gutter - 4,
        vertical: 3,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          color: isUser
              ? AppColors.accent.withValues(alpha: 0.24)
              : (place.isOdd ? AppColors.glassFill : Colors.transparent),
          border: isUser
              ? Border.all(color: AppColors.accent, width: 1.5)
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm),
          child: Row(
            children: [
              SizedBox(
                width: 64,
                child: Text(
                  '#$rank',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  textDirection: TextDirection.ltr,
                  style: textTheme.labelLarge?.copyWith(
                    color:
                        medal ??
                        (isUser ? AppColors.accent : AppColors.textTertiary),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 14,
                backgroundColor: (medal ?? AppColors.accent).withValues(
                  alpha: isUser ? 0.9 : 0.22,
                ),
                child: Text(
                  name.characters.first.toUpperCase(),
                  style: textTheme.labelMedium?.copyWith(
                    color: isUser ? AppColors.onAccent : AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge?.copyWith(
                    color: ink,
                    fontWeight: isUser ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: AppSpace.xs),
              Text(
                time,
                textDirection: TextDirection.ltr,
                style: textTheme.titleSmall?.copyWith(
                  color: isUser ? AppColors.accent : ink,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The daily page's live card: before solving, a reminder with how many
/// rivals solved today and their average; after, the user's rank. Opens
/// the leaderboard.
class LeaderboardStatusCard extends ConsumerStatefulWidget {
  const LeaderboardStatusCard({super.key, required this.onOpen});

  final VoidCallback onOpen;

  @override
  ConsumerState<LeaderboardStatusCard> createState() =>
      _LeaderboardStatusCardState();
}

class _LeaderboardStatusCardState extends ConsumerState<LeaderboardStatusCard>
    with LiveLeaderboard {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final board = watchLeaderboard();
    final rank = board.userRank;
    final field =
        '${l10n.leaderboardSolvedToday(board.rivalCount, formatCount(l10n, board.rivalCount))}'
        ' • ${l10n.leaderboardAvgTime(formatTime(board.averageMillis))}';
    final accent = rank == null ? AppColors.accentWarm : AppColors.gold;
    return GlassCard(
      key: const ValueKey('leaderboard-status'),
      selected: true,
      accent: accent,
      onTap: widget.onOpen,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.sm,
        AppSpace.xs,
        AppSpace.sm,
      ),
      child: Row(
        children: [
          Icon(
            rank == null
                ? Icons.notifications_active_rounded
                : Icons.emoji_events_rounded,
            color: accent,
          ),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rank == null
                      ? l10n.leaderboardReminder
                      : l10n.leaderboardRankOf(
                          formatCount(l10n, rank),
                          formatCount(l10n, board.total),
                        ),
                  key: const ValueKey('leaderboard-status-title'),
                  style: textTheme.titleSmall?.copyWith(color: accent),
                ),
                const SizedBox(height: 2),
                Text(
                  field,
                  key: const ValueKey('leaderboard-status-field'),
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Tooltip(
            message: l10n.leaderboardView,
            child: const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
