import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/settings/locale_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass.dart';
import '../solver_3d/solver_3d_screen.dart';
import '../solver_3d/widgets/cube_preview.dart';
import 'home_controller.dart';

/// Landing screen: cube size selector (2x2 - 6x6) and mode selection.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final selected = ref.watch(selectedCubeSizeProvider);

    void comingSoon() {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.comingSoonMessage)));
    }

    return GlassBackground(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: ListView(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 24),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.appTitle,
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      const _LanguageSwitch(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.homeTagline,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 220,
                    child: GlassCard(
                      padding: EdgeInsetsDirectional.zero,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CubePreview(size: selected, spin: true),
                          ),
                          PositionedDirectional(
                            top: 12,
                            start: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.cubeSizeLabel(selected),
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  _levelName(l10n, selected),
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(l10n.chooseCubeSize, style: textTheme.titleLarge),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 96,
                    child: Row(
                      children: [
                        for (final size in kCubeSizes) ...[
                          if (size != kCubeSizes.first)
                            const SizedBox(width: 8),
                          Expanded(
                            child: _SizeCard(
                              size: size,
                              selected: size == selected,
                              onTap: () => ref
                                  .read(selectedCubeSizeProvider.notifier)
                                  .select(size),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(l10n.chooseMode, style: textTheme.titleLarge),
                  const SizedBox(height: 12),
                  _ModeCard(
                    key: const ValueKey('mode-playground'),
                    icon: Icons.view_in_ar_rounded,
                    title: l10n.modePlayground,
                    description: l10n.modePlaygroundDesc,
                    accent: AppColors.accent,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => Solver3DScreen(size: selected),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ModeCard(
                    icon: Icons.photo_camera_rounded,
                    title: l10n.modeScanSolve,
                    description: l10n.modeScanSolveDesc,
                    accent: AppColors.accentSecondary,
                    badge: l10n.comingSoon,
                    onTap: comingSoon,
                  ),
                  const SizedBox(height: 10),
                  _ModeCard(
                    icon: Icons.school_rounded,
                    title: l10n.modeAcademy,
                    description: l10n.modeAcademyDesc,
                    accent: AppColors.accentWarm,
                    badge: l10n.comingSoon,
                    onTap: comingSoon,
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

class _SizeCard extends StatelessWidget {
  const _SizeCard({
    required this.size,
    required this.selected,
    required this.onTap,
  });

  final int size;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      button: true,
      selected: selected,
      label: '${l10n.cubeSizeLabel(size)} ${_levelName(l10n, size)}',
      child: GlassCard(
        key: ValueKey('size-$size'),
        selected: selected,
        onTap: onTap,
        borderRadius: 16,
        padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 4, 6),
        child: Column(
          children: [
            Expanded(child: CubePreview(size: size)),
            const SizedBox(height: 4),
            FittedBox(
              child: Text(
                l10n.cubeSizeLabel(size),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _levelName(AppLocalizations l10n, int size) => switch (size) {
  2 => l10n.cubeLevel2,
  3 => l10n.cubeLevel3,
  4 => l10n.cubeLevel4,
  5 => l10n.cubeLevel5,
  _ => l10n.cubeLevel6,
};

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.accent,
    required this.onTap,
    this.badge,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color accent;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GlassCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: accent.withValues(alpha: 0.18),
              border: Border.all(color: accent.withValues(alpha: 0.5)),
            ),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text(title, style: textTheme.titleMedium)),
                    if (badge != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: AppColors.glassFillStrong,
                        ),
                        child: Text(
                          badge!,
                          style: textTheme.labelSmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Mirrors automatically in RTL (matchTextDirection).
          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ],
      ),
    );
  }
}

class _LanguageSwitch extends ConsumerWidget {
  const _LanguageSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(localeProvider);
    return Tooltip(
      message: l10n.language,
      child: SegmentedButton<String>(
        showSelectedIcon: false,
        style: SegmentedButton.styleFrom(
          backgroundColor: AppColors.glassFill,
          selectedBackgroundColor: AppColors.accent.withValues(alpha: 0.3),
          side: const BorderSide(color: AppColors.glassBorder),
          visualDensity: VisualDensity.compact,
        ),
        segments: [
          ButtonSegment(
            value: 'en',
            label: Text(l10n.languageEnglish, key: const ValueKey('lang-en')),
          ),
          ButtonSegment(
            value: 'he',
            label: Text(l10n.languageHebrew, key: const ValueKey('lang-he')),
          ),
        ],
        selected: {current.languageCode},
        onSelectionChanged: (selection) => ref
            .read(localeProvider.notifier)
            .setLocale(Locale(selection.first)),
      ),
    );
  }
}
