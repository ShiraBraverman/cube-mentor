import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Builds the app-wide dark theme. Component themes carry the spacing,
/// radii and touch sizes so every screen gets them without local styling.
abstract final class AppTheme {
  static ThemeData dark() {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.accent,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppColors.accent,
          onPrimary: AppColors.onAccent,
          secondary: AppColors.accentSecondary,
          onSecondary: AppColors.onAccent,
          tertiary: AppColors.gold,
          error: AppColors.danger,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
          surfaceContainerHighest: AppColors.surfaceRaised,
          secondaryContainer: AppColors.accent.withValues(alpha: 0.22),
          onSecondaryContainer: AppColors.textPrimary,
          outline: AppColors.glassBorder,
          outlineVariant: AppColors.glassBorder,
        );

    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: Colors.transparent,
      splashFactory: InkSparkle.splashFactory,
    );

    final t = base.textTheme.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    );
    final textTheme = t.copyWith(
      displayLarge: t.displayLarge?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
      ),
      headlineLarge: t.headlineLarge?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        height: 1.15,
      ),
      headlineMedium: t.headlineMedium?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.8,
        height: 1.2,
      ),
      headlineSmall: t.headlineSmall?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.4,
        height: 1.25,
      ),
      titleLarge: t.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        height: 1.3,
      ),
      titleMedium: t.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.35,
      ),
      titleSmall: t.titleSmall?.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.35,
      ),
      bodyLarge: t.bodyLarge?.copyWith(height: 1.5),
      bodyMedium: t.bodyMedium?.copyWith(height: 1.5),
      bodySmall: t.bodySmall?.copyWith(
        height: 1.45,
        color: AppColors.textSecondary,
      ),
      labelLarge: t.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
      ),
    );

    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.sm + 2)),
    );
    const buttonPadding = EdgeInsets.symmetric(
      horizontal: AppSpace.lg,
      vertical: AppSpace.sm,
    );
    final buttonText = textTheme.labelLarge?.copyWith(fontSize: 15);

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 64,
        titleSpacing: AppSpace.xs,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: textTheme.titleLarge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(64, AppSpace.touch),
          padding: buttonPadding,
          shape: shape,
          textStyle: buttonText,
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onAccent,
          disabledBackgroundColor: AppColors.glassFill,
          disabledForegroundColor: AppColors.textTertiary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(64, AppSpace.touch),
          padding: buttonPadding,
          shape: shape,
          textStyle: buttonText,
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.glassBorder),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: shape,
          textStyle: buttonText,
          foregroundColor: AppColors.accent,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: AppColors.textPrimary,
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: AppColors.glassFill,
        selectedColor: AppColors.accent.withValues(alpha: 0.24),
        side: const BorderSide(color: AppColors.glassBorder),
        shape: const StadiumBorder(),
        labelStyle: textTheme.labelLarge,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.xs,
          vertical: AppSpace.xs,
        ),
        checkmarkColor: AppColors.textPrimary,
        showCheckmark: false,
      ),
      sliderTheme: base.sliderTheme.copyWith(
        activeTrackColor: AppColors.accent,
        thumbColor: AppColors.textPrimary,
        inactiveTrackColor: AppColors.glassBorder,
        overlayColor: AppColors.accent.withValues(alpha: 0.16),
        trackHeight: 4,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.accent,
        linearTrackColor: AppColors.glassFillStrong,
        circularTrackColor: AppColors.glassFillStrong,
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: AppSpace.md),
        minVerticalPadding: AppSpace.xs,
        iconColor: AppColors.textSecondary,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.glassBorder,
        thickness: 1,
        space: AppSpace.lg,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        showDragHandle: false,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceRaised,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: const BorderSide(color: AppColors.glassBorder),
        ),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.glassFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpace.md,
          vertical: AppSpace.md,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textTertiary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColors.glassBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColors.glassBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.surfaceRaised,
        contentTextStyle: textTheme.bodyMedium,
        insetPadding: const EdgeInsets.all(AppSpace.md),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          side: const BorderSide(color: AppColors.glassBorder),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.surfaceRaised,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.glassBorder),
        ),
        textStyle: textTheme.bodySmall?.copyWith(color: AppColors.textPrimary),
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    );
  }
}
