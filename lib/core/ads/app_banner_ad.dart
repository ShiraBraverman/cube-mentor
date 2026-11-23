import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'ad_config.dart';
import 'ad_service.dart';

/// A bottom adaptive banner slot.
///
/// Takes no space at all until an ad has actually loaded, so offline users,
/// users without ad consent and desktop builds never see an empty box. Once
/// loaded it reserves exactly the banner's height (at most
/// `AdConfig.maxBannerHeight`), always below the content it is placed
/// under, never on top of it.
///
/// [visible] hides a loaded banner without discarding it (e.g. while the
/// Speed Timer runs). The slot does not add bottom system insets: place it
/// above a widget that does (the dock) or wrap it in a `SafeArea`.
class AppBannerAd extends ConsumerStatefulWidget {
  const AppBannerAd({super.key, this.visible = true});

  final bool visible;

  @override
  ConsumerState<AppBannerAd> createState() => _AppBannerAdState();
}

class _AppBannerAdState extends ConsumerState<AppBannerAd> {
  BannerSlot? _slot;
  int? _requestedWidth;
  bool _loading = false;

  @override
  void dispose() {
    _slot?.dispose();
    super.dispose();
  }

  Future<void> _load(int width) async {
    if (_loading || width == _requestedWidth) return;
    _loading = true;
    _requestedWidth = width;
    BannerSlot? slot;
    try {
      slot = await ref.read(adServiceProvider).loadBanner(width);
    } catch (_) {
      slot = null;
    }
    _loading = false;
    if (!mounted) {
      slot?.dispose();
      return;
    }
    setState(() {
      _slot?.dispose();
      _slot = slot;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(adsTestingBypassProvider)) return const SizedBox.shrink();
    final canRequestAds = ref.watch(adsProvider.select((c) => c.canRequestAds));
    if (!canRequestAds) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth.truncate()
            : MediaQuery.sizeOf(context).width.truncate();
        if (width != _requestedWidth) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _load(width);
          });
        }
        final slot = _slot;
        if (slot == null) return const SizedBox(width: double.infinity);
        // Hiding is instant (no size animation), so the page above never
        // passes through an in-between height.
        return Visibility(
          key: const ValueKey('app-banner-ad'),
          visible: widget.visible,
          // Keeps the loaded ad while hidden.
          maintainState: true,
          child: SizedBox(
            width: double.infinity,
            height: slot.height,
            child: Center(child: slot.build()),
          ),
        );
      },
    );
  }
}
