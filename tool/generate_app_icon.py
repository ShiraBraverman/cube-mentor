"""Draws the CubeMentor launcher icon into assets/icon/: a glossy 3D cube
framed by glowing camera viewfinder corners with a scan beam across the
tiles (see tool/brand_art.py). flutter_launcher_icons then builds the
Android (legacy + adaptive) and iOS icons from these files:

    python tool/generate_app_icon.py
    dart run flutter_launcher_icons

Run from the repository root.
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from brand_art import background, scan_emblem  # noqa: E402

SIZE = 1024


def main():
    # Full icon (legacy Android, iOS, Play Store listing).
    scan_emblem(SIZE).convert('RGB').save('assets/icon/app_icon.png')
    # Adaptive icon: the emblem inside the 66% safe zone over a transparent
    # canvas; the background layer carries the gradient and glow.
    scan_emblem(SIZE, scale=0.68, transparent=True).save(
        'assets/icon/app_icon_foreground.png')
    background(SIZE, SIZE).convert('RGB').save(
        'assets/icon/app_icon_background.png')
    # Play Console's 512 x 512 hi-res icon.
    os.makedirs('store_assets', exist_ok=True)
    scan_emblem(SIZE).convert('RGB').resize((512, 512)).save(
        'store_assets/PLAY_ICON_512.png')


if __name__ == '__main__':
    main()
