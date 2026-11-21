import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/settings/nickname.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass.dart';
import '../../../core/theme/ui_kit.dart';
import '../../timer/model/timer_stats.dart';
import 'daily_leaderboard.dart';
import 'leaderboard_service.dart';

/// Height of one leaderboard row; fixed so the user's row can be centered
/// without laying out the rows above it.
const double kLeaderboardRowExtent = 56;

/// "4,820" in the app language (Latin digits where intl lacks the locale).
String formatCount(AppLocalizations l10n, int value) {
  final locale = NumberFormat.localeExists(l10n.localeName)
      ? l10n.localeName
      : 'en';
  return NumberFormat.decimalPattern(locale).format(value);
}

/// "238 players solved it today • Avg time: 43.1", or the state of the
/// connection when there is no board to describe.
String leaderboardFieldText(AppLocalizations l10n, LeaderboardView view) {
  final board = view.board;
  if (board == null) {
    return view.loading ? l10n.leaderboardConnecting : l10n.leaderboardOffline;
  }
  if (board.isEmpty) return l10n.leaderboardBeFirst;
  return '${l10n.leaderboardSolvedToday(board.solverCount, formatCount(l10n, board.solverCount))}'
      ' • ${l10n.leaderboardAvgTime(formatTime(board.averageMillis))}';
}

/// The live global ranking of today's challenge, opened centered on the
/// user's row.
class DailyLeaderboardScreen extends ConsumerStatefulWidget {
  const DailyLeaderboardScreen({super.key});

  @override
  ConsumerState<DailyLeaderboardScreen> createState() =>
      _DailyLeaderboardScreenState();
}

class _DailyLeaderboardScreenState
    extends ConsumerState<DailyLeaderboardScreen> {
  final _scroll = ScrollController();

  /// The list was centered on the user once; afterwards live updates keep
  /// the reader's position.
  bool _centered = false;

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  double _offsetFor(DailyLeaderboard board, double viewport) =>
      board.userIndex == null
      ? 0
      : centeredOffset(
          index: board.userIndex!,
          rowExtent: kLeaderboardRowExtent,
          viewport: viewport,
          rowCount: board.rows.length,
        );

  void _jumpToMe(DailyLeaderboard board) {
    if (!_scroll.hasClients) return;
    _scroll.animateTo(
      _offsetFor(board, _scroll.position.viewportDimension),
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  /// Centers the user's row the first time it is on the board (the board
  /// arrives from the network after the screen opened).
  void _centerOnce(DailyLeaderboard board) {
    if (_centered || board.userIndex == null) return;
    _centered = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scroll.hasClients) return;
      _scroll.jumpTo(_offsetFor(board, _scroll.position.viewportDimension));
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final view = ref.watch(leaderboardViewProvider);
    final board = view.board;
    final name =
        ref.watch(nicknameProvider.select((n) => n.name)) ??
        l10n.leaderboardYou;
    final rank = board?.userRank;
    final myMillis = board?.user?.millis ?? view.localMillis;
    if (board != null) _centerOnce(board);

    return GlassBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.leaderboardTitle),
          actions: [
            if (rank != null)
              IconButton(
                key: const ValueKey('leaderboard-jump'),
                tooltip: l10n.leaderboardJumpToMe,
                onPressed: () => _jumpToMe(board!),
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
                              if (rank != null)
                                Text(
                                  l10n.leaderboardRankOf(
                                    formatCount(l10n, rank),
                                    formatCount(l10n, board!.total),
                                  ),
                                  key: const ValueKey('leaderboard-rank'),
                                  style: textTheme.headlineSmall?.copyWith(
                                    color: AppColors.gold,
                                  ),
                                )
                              else if (myMillis == null)
                                Text(
                                  l10n.leaderboardNotRanked,
                                  key: const ValueKey('leaderboard-unranked'),
                                  style: textTheme.titleSmall,
                                ),
                              if (myMillis != null)
                                Text(
                                  l10n.leaderboardYourTime(
                                    formatTime(myMillis),
                                  ),
                                  style: rank != null
                                      ? textTheme.bodyMedium
                                      : textTheme.titleSmall,
                                ),
                              // Offline with nothing cached, the notice
                              // below says it all.
                              if (board != null || view.loading) ...[
                                const SizedBox(height: 2),
                                Text(
                                  leaderboardFieldText(l10n, view),
                                  key: const ValueKey('leaderboard-field'),
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (view.offline || view.pendingSync)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      AppSpace.gutter,
                      0,
                      AppSpace.gutter,
                      AppSpace.sm,
                    ),
                    child: _Notice(
                      offline: view.offline,
                      cached: board != null,
                      pendingSync: view.pendingSync && rank == null,
                      onRetry: () {
                        ref.invalidate(leaderboardPageProvider);
                        ref.read(leaderboardSyncProvider.notifier).sync();
                      },
                    ),
                  ),
                Expanded(
                  child: board == null
                      ? (view.loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  key: ValueKey('leaderboard-loading'),
                                ),
                              )
                            : const Center(
                                child: Icon(
                                  Icons.cloud_off_rounded,
                                  size: 56,
                                  color: AppColors.textTertiary,
                                ),
                              ))
                      : Scrollbar(
                          controller: _scroll,
                          interactive: true,
                          child: ListView.builder(
                            key: const ValueKey('leaderboard-list'),
                            controller: _scroll,
                            itemExtent: kLeaderboardRowExtent,
                            padding: EdgeInsets.zero,
                            itemCount: board.rows.length,
                            itemBuilder: (context, i) {
                              final row = board.rows[i];
                              if (row == null) return const _GapRow();
                              final nickname = row.record.nickname;
                              return _LeaderboardRow(
                                key: row.isUser
                                    ? const ValueKey('leaderboard-me')
                                    : null,
                                rank: formatCount(l10n, row.rank),
                                place: row.rank,
                                name: row.isUser
                                    ? name
                                    : (nickname.isEmpty
                                          ? l10n.leaderboardAnonymous
                                          : nickname),
                                time: formatTime(row.millis),
                                isUser: row.isUser,
                                pending: row.pending,
                              );
                            },
                          ),
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
                        Icons.public_rounded,
                        size: 14,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: AppSpace.xxs),
                      Expanded(
                        child: Text(
                          l10n.leaderboardLive,
                          key: const ValueKey('leaderboard-live'),
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

/// Offline / not-yet-synced notice above the list.
class _Notice extends StatelessWidget {
  const _Notice({
    required this.offline,
    required this.cached,
    required this.pendingSync,
    required this.onRetry,
  });

  final bool offline;
  final bool cached;
  final bool pendingSync;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final lines = [
      if (offline) cached ? l10n.leaderboardCached : l10n.leaderboardOffline,
      if (pendingSync) l10n.leaderboardPendingSync,
    ];
    if (lines.isEmpty) return const SizedBox.shrink();
    return GlassCard(
      key: const ValueKey('leaderboard-notice'),
      accent: AppColors.accentWarm,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.xs,
        AppSpace.xxs,
        AppSpace.xs,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSpace.xxs),
            child: Icon(
              offline ? Icons.cloud_off_rounded : Icons.cloud_upload_rounded,
              size: 20,
              color: AppColors.accentWarm,
            ),
          ),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppSpace.xxs),
                  child: Text(
                    lines.join('\n'),
                    key: ValueKey(
                      offline ? 'leaderboard-offline' : 'leaderboard-pending',
                    ),
                    style: textTheme.bodySmall,
                  ),
                ),
                // The theme's full-width button minimum would squeeze the
                // text, so the retry button sits under it, compact.
                if (offline)
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      key: const ValueKey('leaderboard-retry'),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(48, 36),
                      ),
                      onPressed: onRetry,
                      child: Text(l10n.leaderboardRetry),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The "…" between the top rows and the rows around the user.
class _GapRow extends StatelessWidget {
  const _GapRow();

  @override
  Widget build(BuildContext context) => const Center(
    key: ValueKey('leaderboard-gap'),
    child: Icon(Icons.more_vert_rounded, color: AppColors.textTertiary),
  );
}

class _LeaderboardRow extends StatelessWidget {
  const _LeaderboardRow({
    super.key,
    required this.rank,
    required this.place,
    required this.name,
    required this.time,
    required this.isUser,
    this.pending = false,
  });

  final String rank;
  final int place;
  final String name;
  final String time;
  final bool isUser;
  final bool pending;

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
                  name.characters.isEmpty
                      ? '?'
                      : name.characters.first.toUpperCase(),
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
              if (pending) ...[
                const Icon(
                  Icons.cloud_upload_outlined,
                  key: ValueKey('leaderboard-me-pending'),
                  size: 16,
                  color: AppColors.textTertiary,
                ),
                const SizedBox(width: AppSpace.xxs),
              ],
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
/// players solved today and their average; after, the user's rank. Opens
/// the leaderboard.
class LeaderboardStatusCard extends ConsumerWidget {
  const LeaderboardStatusCard({super.key, required this.onOpen});

  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final view = ref.watch(leaderboardViewProvider);
    final board = view.board;
    final rank = board?.userRank;
    final solved = view.localMillis != null;
    final title = rank != null
        ? l10n.leaderboardRankOf(
            formatCount(l10n, rank),
            formatCount(l10n, board!.total),
          )
        : solved
        ? l10n.leaderboardYourTime(formatTime(view.localMillis))
        : l10n.leaderboardReminder;
    final field = solved && rank == null && view.pendingSync
        ? l10n.leaderboardPendingSync
        : leaderboardFieldText(l10n, view);
    final accent = rank == null && !solved
        ? AppColors.accentWarm
        : AppColors.gold;
    return GlassCard(
      key: const ValueKey('leaderboard-status'),
      selected: true,
      accent: accent,
      onTap: onOpen,
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpace.md,
        AppSpace.sm,
        AppSpace.xs,
        AppSpace.sm,
      ),
      child: Row(
        children: [
          Icon(
            rank == null && !solved
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
                  title,
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
