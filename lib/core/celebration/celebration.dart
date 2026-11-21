import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../l10n/generated/app_localizations.dart';
import '../settings/nickname.dart';
import '../theme/app_colors.dart';

/// "Way to go, Shira!" — or "Way to go!" when no nickname was given.
String celebrationTitle(AppLocalizations l10n, String? name) =>
    name == null ? l10n.celebrateAnon : l10n.celebrateNamed(name);

/// Rich celebration card: a glowing gold-to-accent gradient, a trophy-style
/// badge, the user's name in the headline and what they achieved below.
/// Pops in with a short bounce. Used inline (solve dock, lesson end) and as
/// the floating toast of [showCelebration].
class CelebrationCard extends ConsumerWidget {
  const CelebrationCard({
    super.key,
    required this.message,
    this.icon = Icons.celebration_rounded,
    this.accent = AppColors.accentSecondary,
    this.compact = false,
    this.trailing,
    this.footer,
  });

  /// What was achieved, e.g. "Cube solved!".
  final String message;
  final IconData icon;
  final Color accent;

  /// Tighter padding and type for docks under the 3D cube.
  final bool compact;

  /// Optional widget after the text (e.g. a crown tracker).
  final Widget? trailing;

  /// Optional widget under the message (e.g. the move-count badge).
  final Widget? footer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final name = ref.watch(nicknameProvider.select((n) => n.name));
    final radius = BorderRadius.circular(AppRadius.md);
    final badge = compact ? 40.0 : 52.0;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.85, end: 1),
      duration: const Duration(milliseconds: 420),
      curve: Curves.elasticOut,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: Container(
        key: const ValueKey('celebration-card'),
        padding: EdgeInsetsDirectional.fromSTEB(
          compact ? AppSpace.sm : AppSpace.md,
          compact ? AppSpace.sm : AppSpace.md,
          compact ? AppSpace.sm : AppSpace.md,
          compact ? AppSpace.sm : AppSpace.md,
        ),
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              AppColors.gold.withValues(alpha: 0.30),
              accent.withValues(alpha: 0.20),
              AppColors.accent.withValues(alpha: 0.16),
            ],
          ),
          border: Border.all(color: AppColors.gold.withValues(alpha: 0.65)),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.30),
              blurRadius: 28,
              spreadRadius: -6,
            ),
            BoxShadow(
              color: accent.withValues(alpha: 0.22),
              blurRadius: 40,
              spreadRadius: -10,
              offset: const Offset(0, 10),
            ),
          ],
          color: AppColors.surface.withValues(alpha: 0.92),
        ),
        child: Row(
          children: [
            Container(
              width: badge,
              height: badge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.gold, AppColors.accentWarm],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withValues(alpha: 0.55),
                    blurRadius: 18,
                  ),
                ],
              ),
              child: Icon(icon, color: AppColors.onAccent, size: badge * 0.55),
            ),
            SizedBox(width: compact ? AppSpace.sm : AppSpace.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    celebrationTitle(l10n, name),
                    key: const ValueKey('celebration-title'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (compact ? textTheme.titleMedium : textTheme.titleLarge)
                            ?.copyWith(
                              color: AppColors.gold,
                              fontWeight: FontWeight.w800,
                            ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    key: const ValueKey('celebration-message'),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (compact ? textTheme.bodyMedium : textTheme.bodyLarge)
                            ?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                  if (footer != null) ...[
                    const SizedBox(height: AppSpace.xxs),
                    footer!,
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: AppSpace.xs),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

/// How long the floating celebration stays on screen (including its slide
/// in and out).
const Duration kCelebrationDuration = Duration(milliseconds: 3800);

OverlayEntry? _currentCelebration;

/// Floats a [CelebrationCard] in from the top of the app (over every
/// route, so it survives a page closing right after the achievement) and
/// slides it away after [kCelebrationDuration]. Tap to dismiss early. A new
/// celebration replaces the previous one.
void showCelebration(
  BuildContext context, {
  required String message,
  IconData icon = Icons.celebration_rounded,
  Color accent = AppColors.accentSecondary,
}) {
  final overlay = Overlay.maybeOf(context, rootOverlay: true);
  if (overlay == null) return;
  final previous = _currentCelebration;
  if (previous != null && previous.mounted) previous.remove();
  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => _CelebrationToast(
      message: message,
      icon: icon,
      accent: accent,
      onDone: () {
        if (_currentCelebration == entry) _currentCelebration = null;
        if (entry.mounted) entry.remove();
      },
    ),
  );
  _currentCelebration = entry;
  overlay.insert(entry);
}

class _CelebrationToast extends StatefulWidget {
  const _CelebrationToast({
    required this.message,
    required this.icon,
    required this.accent,
    required this.onDone,
  });

  final String message;
  final IconData icon;
  final Color accent;
  final VoidCallback onDone;

  @override
  State<_CelebrationToast> createState() => _CelebrationToastState();
}

class _CelebrationToastState extends State<_CelebrationToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: kCelebrationDuration,
  );

  // Slide in (10%), stay, slide out (12%).
  late final Animation<double> _shown = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeOutBack)),
      weight: 10,
    ),
    TweenSequenceItem(tween: ConstantTween(1.0), weight: 78),
    TweenSequenceItem(
      tween: Tween(
        begin: 1.0,
        end: 0.0,
      ).chain(CurveTween(curve: Curves.easeInCubic)),
      weight: 12,
    ),
  ]).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward().whenCompleteOrCancel(() {
      if (mounted) widget.onDone();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() {
    // Jump to the slide-out part.
    if (_controller.value < 0.88) {
      _controller.value = 0.88;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.sm,
            AppSpace.xs,
            AppSpace.sm,
            0,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: AnimatedBuilder(
                animation: _shown,
                builder: (context, child) {
                  final t = _shown.value;
                  return Opacity(
                    opacity: t.clamp(0.0, 1.0),
                    child: Transform.translate(
                      offset: Offset(0, (1 - t) * -90),
                      child: child,
                    ),
                  );
                },
                child: Material(
                  type: MaterialType.transparency,
                  child: GestureDetector(
                    key: const ValueKey('celebration-toast'),
                    onTap: _dismiss,
                    child: CelebrationCard(
                      message: widget.message,
                      icon: widget.icon,
                      accent: widget.accent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
