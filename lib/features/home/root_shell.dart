import 'package:material_ui/material_ui.dart';

import '../../core/ads/app_banner_ad.dart';
import '../../core/theme/glass.dart';
import 'home_screen.dart';

/// The app's root: the home screen with the adaptive banner below it,
/// never over the content. Every experience (scan & solve, academy,
/// patterns, timer & daily challenge) opens on top from a home card.
class RootShell extends StatelessWidget {
  const RootShell({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassBackground(
      child: Scaffold(
        key: ValueKey('root-shell'),
        body: HomeScreen(),
        bottomNavigationBar: SafeArea(top: false, child: AppBannerAd()),
      ),
    );
  }
}
