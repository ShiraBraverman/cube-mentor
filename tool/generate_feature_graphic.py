"""Draws the Google Play feature graphic (1024 x 500) into
store_assets/FEATURE_GRAPHIC.png: the scan emblem (tool/brand_art.py) on the
left, the app name, a tagline and three feature chips on the right.

Run from the repository root:  python tool/generate_feature_graphic.py
Optional: --title / --tagline / --chips "A|B|C" / --out for a localized
variant (Play Console accepts one feature graphic per listing language).
"""
import argparse
import os
import sys

from PIL import Image, ImageDraw, ImageFilter

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from brand_art import (ACCENT, SCAN, background, cube_layer,  # noqa: E402
                       viewfinder_layer)

W, H = 1024, 500

FONT_CANDIDATES = {
    'bold': ['C:/Windows/Fonts/segoeuib.ttf', 'C:/Windows/Fonts/arialbd.ttf',
             '/System/Library/Fonts/Supplemental/Arial Bold.ttf',
             '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf'],
    'regular': ['C:/Windows/Fonts/segoeui.ttf', 'C:/Windows/Fonts/arial.ttf',
                '/System/Library/Fonts/Supplemental/Arial.ttf',
                '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'],
}


def font(kind, size, override=None):
    from PIL import ImageFont
    for path in ([override] if override else []) + FONT_CANDIDATES[kind]:
        if path and os.path.exists(path):
            return ImageFont.truetype(path, size)
    return ImageFont.load_default()


def fit(draw, text, kind, start, max_width, override=None):
    """Largest font size <= [start] whose [text] fits [max_width]."""
    size = start
    while size > 12:
        f = font(kind, size, override)
        if draw.textlength(text, font=f) <= max_width:
            return f
        size -= 2
    return font(kind, size, override)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--title', default='CubeMentor')
    ap.add_argument('--tagline', default='Scan any cube. Solve it in seconds.')
    ap.add_argument('--chips', default='2×2 to 6×6|Camera scan|3D step-by-step')
    ap.add_argument('--font', default=None, help='TTF for non-Latin scripts')
    ap.add_argument('--out', default='store_assets/FEATURE_GRAPHIC.png')
    args = ap.parse_args()

    img = background(W, H, glow_center=(0.25, 0.5), glow_radius=0.62)
    # A second, mint glow behind the text side.
    glow = Image.new('L', (W, H), 0)
    ImageDraw.Draw(glow).ellipse([560, 60, 1080, 520], fill=55)
    glow = glow.filter(ImageFilter.GaussianBlur(120))
    img.paste(Image.new('RGBA', (W, H), SCAN + (255,)), (0, 0), glow)

    # Emblem: the cube in its viewfinder on the left, drawn on a full-width
    # square canvas so the glows fade out naturally (then cropped).
    side = W
    emblem = Image.new('RGBA', (side, side), (0, 0, 0, 0))
    cx, cy, s = 270, H / 2 + 4, H * 0.3
    cube, beam_y = cube_layer(side, cx, cy, s)
    emblem.alpha_composite(cube)
    half = H * 0.41
    emblem.alpha_composite(viewfinder_layer(
        side, (cx - half, cy - half, cx + half, cy + half), beam_y,
        thickness=half * 2 * 0.036, arm=half * 2 * 0.22))
    img.alpha_composite(emblem.crop((0, 0, W, H)))

    d = ImageDraw.Draw(img)
    chips = Image.new('RGBA', (W, H), (0, 0, 0, 0))
    cd = ImageDraw.Draw(chips)
    x0, max_w = 548, W - 548 - 44
    title_f = fit(d, args.title, 'bold', 84, max_w, args.font)
    d.text((x0, 112), args.title, font=title_f, fill=(244, 247, 255))
    # Accent underline.
    d.rounded_rectangle([x0 + 2, 214, x0 + 92, 222], radius=4, fill=SCAN)
    tag_f = fit(d, args.tagline, 'regular', 34, max_w, args.font)
    d.text((x0, 242), args.tagline, font=tag_f, fill=(196, 206, 230))

    # Feature chips.
    chip_f = font('bold', 22, args.font)
    x, y = x0, 318
    for label in args.chips.split('|'):
        tw = d.textlength(label, font=chip_f)
        w = tw + 36
        if x + w > W - 30:
            x, y = x0, y + 56
        cd.rounded_rectangle([x, y, x + w, y + 44], radius=22,
                             fill=(255, 255, 255, 26),
                             outline=ACCENT + (200,), width=2)
        cd.text((x + 18, y + 8), label, font=chip_f, fill=(232, 238, 255, 255))
        x += w + 12
    img.alpha_composite(chips)

    os.makedirs(os.path.dirname(args.out) or '.', exist_ok=True)
    img.convert('RGB').save(args.out)
    print('wrote', args.out)


if __name__ == '__main__':
    main()
