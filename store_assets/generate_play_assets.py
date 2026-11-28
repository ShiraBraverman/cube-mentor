"""Generates the Google Play graphic assets for CubeMentor in store_assets/:

    app_icon_512.png             512 x 512   hi-res icon (no text)
    feature_graphic_1024x500.png 1024 x 500  feature graphic
    screenshot_1..4.png          1080 x 1920 phone screenshots (9:16)

The icon and feature graphic draw the glossy isometric cube from
tool/brand_art.py on a deep navy (#0F172A) canvas with cyan accents. The
screenshots frame the real app screens rendered by
test/screenshots/ux_screen_map_test.dart (docs/screens/, refreshed with
`python tool/update_ux_board.py`) under a headline banner, so the store
always shows the actual UI. The "AdMob adaptive banner" placeholder strip
at the bottom of those renders is cropped off.

Every output is RGB (no alpha) and checked for exact size and Play's file
size limits at the end of the run. Run from the repository root:

    python store_assets/generate_play_assets.py

Requires Pillow.
"""
import math
import os
import sys

from PIL import Image, ImageChops, ImageDraw, ImageFilter, ImageFont

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tool'))
import brand_art  # noqa: E402

OUT = os.path.join(ROOT, 'store_assets')
SCREENS = os.path.join(ROOT, 'docs', 'screens')

NAVY = (15, 23, 42)         # #0F172A
SLATE = (30, 41, 59)        # #1E293B
DEEP = (5, 8, 18)
CYAN = (34, 211, 238)       # #22D3EE
CYAN_CORE = (207, 250, 254)
ACCENT = (110, 139, 255)    # app accent (indigo)
TEXT = (241, 244, 251)
TEXT_2 = (152, 162, 188)

# The cube art tints its scanned tiles and beam with brand_art.SCAN; switch
# it to cyan for these assets.
brand_art.SCAN = CYAN
brand_art.SCAN_CORE = CYAN_CORE

FONT_DIRS = ['C:/Windows/Fonts', '/usr/share/fonts/truetype/dejavu',
             '/System/Library/Fonts/Supplemental']
BOLD = ['segoeuib.ttf', 'DejaVuSans-Bold.ttf', 'Arial Bold.ttf']
BLACK = ['seguibl.ttf'] + BOLD
SEMI = ['seguisb.ttf'] + BOLD
REGULAR = ['segoeui.ttf', 'DejaVuSans.ttf', 'Arial.ttf']

# Height of the real app frame without the ad placeholder strip
# (docs/screens renders are 720 x 1560).
APP_FRAME_H = 1462

# Play Console limits per asset type (bytes).
MB = 1024 * 1024
LIMITS = {'icon': 1 * MB, 'feature': 15 * MB, 'shot': 8 * MB}


def font(names, size):
    for name in names:
        for folder in FONT_DIRS:
            path = os.path.join(folder, name)
            if os.path.exists(path):
                return ImageFont.truetype(path, size)
    return ImageFont.load_default()


def gradient(w, h, stops, angle_deg=90):
    """Linear gradient through [stops] ((t, rgb), ...) along [angle_deg]
    (90 = top to bottom, 0 = left to right)."""
    a = math.radians(angle_deg)
    dx, dy = math.cos(a), math.sin(a)
    # Project the corners to normalize t into 0..1.
    proj = [x * dx + y * dy for x in (0, w) for y in (0, h)]
    lo, hi = min(proj), max(proj)
    n = 512
    ramp = Image.new('RGB', (n, 1))
    for i in range(n):
        t = i / (n - 1)
        for (t0, c0), (t1, c1) in zip(stops, stops[1:]):
            if t0 <= t <= t1:
                ramp.putpixel((i, 0), brand_art.lerp(
                    c0, c1, (t - t0) / max(1e-6, t1 - t0)))
                break
    # Sample the ramp per pixel via a small grid, then upscale (smooth).
    gw, gh = max(2, w // 4), max(2, h // 4)
    grid = Image.new('RGB', (gw, gh))
    px = grid.load()
    for y in range(gh):
        for x in range(gw):
            p = (x * w / (gw - 1)) * dx + (y * h / (gh - 1)) * dy
            px[x, y] = ramp.getpixel((round((p - lo) / (hi - lo) * (n - 1)), 0))
    return grid.resize((w, h), Image.BICUBIC).convert('RGBA')


def glow(img, center, radius, color, strength):
    """Soft radial glow of [color] blended over [img] in place."""
    w, h = img.size
    m = Image.new('L', (w, h), 0)
    cx, cy = center
    ImageDraw.Draw(m).ellipse([cx - radius, cy - radius, cx + radius,
                               cy + radius], fill=strength)
    m = m.filter(ImageFilter.GaussianBlur(radius * 0.5))
    img.paste(Image.new('RGBA', (w, h), color + (255,)), (0, 0), m)


def cube_on(canvas, cx, cy, s, beam_t=0.56):
    """Composites the glossy cube (radius [s]) centered at (cx, cy) on
    [canvas], which may be non-square."""
    w, h = canvas.size
    side = max(w, h)
    layer, beam_y = brand_art.cube_layer(side, cx, cy, s, beam_t=beam_t)
    canvas.alpha_composite(layer.crop((0, 0, w, h)))
    return beam_y


def cyan_beam(canvas, x0, x1, y, width):
    """Luminous horizontal scan line with a soft cyan halo."""
    w, h = canvas.size
    for spread, alpha, color in ((width * 0.22, 110, CYAN),
                                 (width * 0.06, 210, CYAN),
                                 (width * 0.018, 255, CYAN),
                                 (width * 0.007, 255, CYAN_CORE)):
        m = Image.new('L', (w, h), 0)
        ImageDraw.Draw(m).rounded_rectangle(
            [x0, y - spread / 2, x1, y + spread / 2], radius=spread / 2,
            fill=alpha)
        m = m.filter(ImageFilter.GaussianBlur(max(1, spread * 0.35)))
        # Fade toward both ends.
        ends = Image.new('L', (w, h), 0)
        ed = ImageDraw.Draw(ends)
        steps = 48
        for i in range(steps):
            xa = x0 + (x1 - x0) * i / steps
            xb = x0 + (x1 - x0) * (i + 1) / steps
            ed.rectangle([xa, 0, xb, h], fill=int(
                255 * math.sin(math.pi * (i + 0.5) / steps) ** 0.6))
        canvas.paste(Image.new('RGBA', (w, h), color + (255,)), (0, 0),
                     ImageChops.multiply(m, ends))


def ring(canvas, cx, cy, rx, ry, width, color, alpha=255, blur=0):
    w, h = canvas.size
    m = Image.new('L', (w, h), 0)
    ImageDraw.Draw(m).ellipse([cx - rx, cy - ry, cx + rx, cy + ry],
                              outline=alpha, width=width)
    if blur:
        m = m.filter(ImageFilter.GaussianBlur(blur))
    canvas.paste(Image.new('RGBA', (w, h), color + (255,)), (0, 0), m)


# ---------------------------------------------------------------- icon --

def app_icon():
    size = 1024  # drawn at 2x, downsampled to 512
    img = gradient(size, size, [(0, (22, 32, 58)), (0.55, NAVY),
                                (1, (8, 12, 26))], angle_deg=90)
    glow(img, (size * 0.5, size * 0.47), size * 0.34, CYAN, 70)
    glow(img, (size * 0.5, size * 0.47), size * 0.22, ACCENT, 60)
    # Orbit ring under the cube, echoing the app's 3D stage.
    ring(img, size * 0.5, size * 0.79, size * 0.33, size * 0.075,
         10, CYAN, 230, blur=10)
    ring(img, size * 0.5, size * 0.79, size * 0.33, size * 0.075, 5, CYAN_CORE,
         200, blur=1)
    s = size * 0.34
    cx, cy = size * 0.5, size * 0.49
    beam_y = cube_on(img, cx, cy, s, beam_t=0.58)
    k = math.cos(math.radians(30))
    cyan_beam(img, cx - s * k * 1.32, cx + s * k * 1.32, beam_y, s * 2)
    out = img.convert('RGB').resize((512, 512), Image.LANCZOS)
    return save(out, OUT, 'app_icon_512.png', 'icon', (512, 512))


# ------------------------------------------------------------ languages --

# Per-language text, fonts and screen renders. English uses the UX board
# renders in docs/screens; other languages render their own screens with
# the same test into store_assets/<lang>/raw (git-ignored):
#
#   flutter test test/screenshots/ux_screen_map_test.dart --update-goldens \
#       --dart-define=SHOT_LOCALE=he --dart-define=SHOT_OUT=store_assets/he/raw
LANGS = {
    'en': {
        'rtl': False,
        'out': OUT,
        'screens': SCREENS,
        'title_font': BLACK,
        'feature': ('Scan & Solve', '2×2–6×6 Cubes in 3D'),
        'shots': [
            ('Scan Any Cube with Camera',
             'Live color detection on every sticker'),
            ('2×2 to 6×6 Cubes Supported', 'Pick a size and turn it in 3D'),
            ('3D Step-by-Step Solutions',
             'Every move animated, play, pause, step back'),
            ('Interactive Cube Academy',
             'Layer-by-layer lessons and a speed timer'),
        ],
    },
    'he': {
        'rtl': True,
        'out': os.path.join(OUT, 'he'),
        'screens': os.path.join(OUT, 'he', 'raw'),
        # Segoe UI Black has no Hebrew glyphs; Bold does.
        'title_font': BOLD,
        # Cube sizes are wrapped in LRI ... PDI (U+2066 / U+2069) so they
        # read left to right, as in the app's Hebrew strings.
        'feature': ('סריקה ופתרון קוביות', '\u20662×2–6×6\u2069 בתלת-ממד'),
        'shots': [
            ('סורקים כל קובייה במצלמה', 'זיהוי צבעים חי בכל מדבקה'),
            ('תמיכה בקוביות\n2×2 עד 6×6', 'בוחרים גודל ומסובבים בתלת-ממד'),
            ('פתרון תלת-ממדי צעד-אחר-צעד',
             'כל מהלך מונפש: הפעלה, השהיה וחזרה'),
            ('אקדמיה אינטראקטיבית וטיימר',
             'שיעורי שכבה אחר שכבה וטיימר מהירות'),
            ('דוגמאות ותבניות קובייה מגניבות',
             'לוח שחמט, קובייה בתוך קובייה ועוד'),
        ],
    },
}


def visual(text, rtl):
    """[text] in visual (left-to-right drawing) order. This Pillow has no
    raqm, so right-to-left lines are reordered with python-bidi; Hebrew
    needs no glyph shaping (Arabic would also need arabic-reshaper)."""
    if not rtl:
        return text
    try:
        # python-bidi >= 0.5: full UBA, including isolates (LRI ... PDI).
        from bidi import get_display
    except ImportError:
        sys.exit('pip install "python-bidi>=0.5" (for right-to-left text)')
    shown = get_display(text, base_dir='R')
    # Drop the invisible bidi controls: the fonts have no glyphs for them.
    return ''.join(c for c in shown if not '\u2066' <= c <= '\u2069')


# ------------------------------------------------------ feature graphic --

def feature_graphic(lang):
    cfg = LANGS[lang]
    rtl = cfg['rtl']
    w, h = 1024, 500
    img = gradient(w, h, [(0, NAVY), (1, SLATE)], angle_deg=25)
    # Right-to-left layouts mirror: cube on the left, text on the right.
    cx, cy, s = w * (0.21 if rtl else 0.79), h * 0.46, 150
    glow(img, (cx, h * 0.5), 250, CYAN, 55)
    glow(img, (cx, h * 0.45), 170, ACCENT, 70)

    # Cube with a cyan orbit ring and scan beam.
    ring(img, cx, cy + s * 1.02, s * 1.18, s * 0.26, 6, CYAN, 220, blur=6)
    ring(img, cx, cy + s * 1.02, s * 1.18, s * 0.26, 3, CYAN_CORE, 180)
    beam_y = cube_on(img, cx, cy, s, beam_t=0.58)
    k = math.cos(math.radians(30))
    cyan_beam(img, cx - s * k * 1.45, cx + s * k * 1.45, beam_y, s * 2)

    d = ImageDraw.Draw(img)
    margin = 64

    def put(y, text, f, fill):
        shown = visual(text, rtl)
        x = w - margin - d.textlength(shown, font=f) if rtl else margin
        d.text((x, y), shown, font=f, fill=fill)

    put(132, 'CubeMentor', font(BLACK, 84), TEXT)
    bar_x = w - margin - 104 if rtl else margin + 4
    d.rounded_rectangle([bar_x, 262, bar_x + 100, 272], radius=5, fill=CYAN)
    line1, line2 = cfg['feature']
    sub = font(SEMI, 38)
    put(298, line1, sub, TEXT)
    put(346, line2, sub, CYAN)
    return save(img.convert('RGB'), cfg['out'], 'feature_graphic_1024x500.png',
                'feature', (w, h))


# --------------------------------------------------------- screenshots --

SW, SH = 1080, 1920


def screenshot_canvas():
    img = gradient(SW, SH, [(0, (20, 30, 56)), (0.35, NAVY), (1, DEEP)])
    glow(img, (SW * 0.5, SH * 0.62), 520, ACCENT, 60)
    glow(img, (SW * 0.5, SH * 0.2), 380, CYAN, 26)
    return img


def wrap(d, text, f, max_w):
    """Greedy word wrap in logical order, unless [text] has explicit line
    breaks. Each line is reordered for display afterwards, so
    right-to-left breaks fall between the right words."""
    if '\n' in text:  # explicit breaks win
        return text.split('\n')
    lines, line = [], ''
    for word in text.split(' '):
        probe = f'{line} {word}' if line else word
        if d.textlength(probe, font=f) <= max_w:
            line = probe
        else:
            lines.append(line)
            line = word
    lines.append(line)
    return lines


def headline(img, title, subtitle, cfg):
    """Headline banner: bold title (1-2 lines), cyan bar, subtitle.
    Returns the y just below it."""
    rtl = cfg['rtl']
    d = ImageDraw.Draw(img)
    size = 92
    while True:
        f = font(cfg['title_font'], size)
        lines = wrap(d, title, f, SW - 140)
        if len(lines) <= 2:
            break
        size -= 4
    y = 104
    for line in lines:
        shown = visual(line, rtl)
        tw = d.textlength(shown, font=f)
        d.text(((SW - tw) / 2, y), shown, font=f, fill=TEXT)
        y += int(size * 1.18)
    y += 18
    d.rounded_rectangle([SW / 2 - 56, y, SW / 2 + 56, y + 10], radius=5,
                        fill=CYAN)
    y += 36
    fs = font(REGULAR, 40)
    shown = visual(subtitle, rtl)
    tw = d.textlength(shown, font=fs)
    d.text(((SW - tw) / 2, y), shown, font=fs, fill=TEXT_2)
    return y + 96


def app_frame(cfg, name, crop_ad=True):
    path = os.path.join(cfg['screens'], name)
    if not os.path.exists(path):
        sys.exit(f'missing {path}: render the screens first (see LANGS)')
    shot = Image.open(path).convert('RGB')
    if shot.size != (720, 1560):
        sys.exit(f'unexpected render size {shot.size} for {path}')
    return shot.crop((0, 0, 720, APP_FRAME_H)) if crop_ad else shot


def phone(img, shot, x, y, width, tilt=0.0):
    """Draws [shot] inside a rounded phone bezel at (x, y), [width] wide
    (screen area), with an indigo/cyan glow behind it."""
    sw = int(width)
    sh = int(shot.height * width / shot.width)
    shot = shot.resize((sw, sh), Image.LANCZOS)
    bezel = max(10, int(sw * 0.022))
    radius = int(sw * 0.08)
    pw, ph = sw + 2 * bezel, sh + 2 * bezel
    pad = 120
    layer = Image.new('RGBA', (pw + 2 * pad, ph + 2 * pad), (0, 0, 0, 0))

    halo = Image.new('L', layer.size, 0)
    ImageDraw.Draw(halo).rounded_rectangle(
        [pad, pad, pad + pw, pad + ph], radius=radius + bezel, fill=170)
    halo = halo.filter(ImageFilter.GaussianBlur(44))
    layer.paste(Image.new('RGBA', layer.size, ACCENT + (255,)), (0, 0), halo)

    d = ImageDraw.Draw(layer)
    d.rounded_rectangle([pad, pad, pad + pw, pad + ph], radius=radius + bezel,
                        fill=(9, 11, 18, 255), outline=(78, 90, 122, 255),
                        width=3)
    mask = Image.new('L', (sw, sh), 0)
    ImageDraw.Draw(mask).rounded_rectangle([0, 0, sw, sh], radius=radius,
                                           fill=255)
    layer.paste(shot, (pad + bezel, pad + bezel), mask)
    if tilt:
        layer = layer.rotate(tilt, resample=Image.BICUBIC, expand=True)
        extra_w = (layer.width - (pw + 2 * pad)) // 2
        extra_h = (layer.height - (ph + 2 * pad)) // 2
    else:
        extra_w = extra_h = 0
    img.alpha_composite(layer, (int(x - bezel - pad - extra_w),
                                int(y - bezel - pad - extra_h)))
    return sh


def single_phone(img, top, shot, bottom_margin=70):
    avail_h = SH - top - bottom_margin
    width = min(700, avail_h * shot.width / shot.height)
    phone(img, shot, (SW - width) / 2, top + 8, width)


def two_phones(img, top, back, front, rtl):
    """Two overlapping, slightly tilted phones: [back] high on the side
    where reading starts, [front] lower on the other side."""
    width = 500
    h = front.height * width / front.width
    y_back = top + 20
    y_front = SH - 76 - h
    if rtl:
        phone(img, back, SW - 64 - width, y_back, width, tilt=-3)
        phone(img, front, 72, y_front, width, tilt=3)
    else:
        phone(img, back, 64, y_back, width, tilt=3)
        phone(img, front, SW - 72 - width, y_front, width, tilt=-3)


def chip_row(img, y, labels, active):
    overlay = Image.new('RGBA', img.size, (0, 0, 0, 0))
    d = ImageDraw.Draw(overlay)
    f = font(BOLD, 40)
    gap, padx, hgt = 18, 30, 76
    widths = [d.textlength(t, font=f) + 2 * padx for t in labels]
    x = (SW - sum(widths) - gap * (len(labels) - 1)) / 2
    for t, cw in zip(labels, widths):
        on = t == active
        d.rounded_rectangle([x, y, x + cw, y + hgt], radius=hgt / 2,
                            fill=(CYAN if on else (255, 255, 255, 24)),
                            outline=(CYAN if on else (120, 134, 170)),
                            width=2)
        d.text((x + padx, y + 12), t, font=f,
               fill=(7, 10, 20) if on else TEXT)
        x += cw + gap
    img.alpha_composite(overlay)
    return y + hgt


def screenshots(lang):
    cfg = LANGS[lang]
    rtl, shots = cfg['rtl'], cfg['shots']
    paths = []

    def frame(name, crop_ad=True):
        return app_frame(cfg, name, crop_ad)

    def done(img, n):
        paths.append(save(img.convert('RGB'), cfg['out'],
                          f'screenshot_{n}.png', 'shot', (SW, SH)))

    img = screenshot_canvas()
    top = headline(img, *shots[0], cfg)
    # The scanner is full screen (no ad strip): keep its shutter row.
    single_phone(img, top, frame('05_scanner_camera.png', crop_ad=False))
    done(img, 1)

    img = screenshot_canvas()
    top = headline(img, *shots[1], cfg)
    # Sizes run in reading order, like the app's own size chips.
    sizes = ['2×2', '3×3', '4×4', '5×5', '6×6']
    top = chip_row(img, top - 30, sizes[::-1] if rtl else sizes, '3×3') + 34
    single_phone(img, top, frame('01_home.png'))
    done(img, 2)

    img = screenshot_canvas()
    top = headline(img, *shots[2], cfg)
    single_phone(img, top, frame('09_solver_step_x2.png'))
    done(img, 3)

    img = screenshot_canvas()
    top = headline(img, *shots[3], cfg)
    two_phones(img, top, frame('11_academy.png'), frame('20_timer.png'), rtl)
    done(img, 4)

    if len(shots) > 4:
        # Pattern library: the gallery and the checkerboard being played.
        img = screenshot_canvas()
        top = headline(img, *shots[4], cfg)
        two_phones(img, top, frame('16_patterns.png'),
                   frame('17_pattern_player.png'), rtl)
        done(img, 5)
    return paths


# -------------------------------------------------------------- checks --

def save(img, folder, name, kind, size):
    os.makedirs(folder, exist_ok=True)
    path = os.path.join(folder, name)
    img.save(path, optimize=True)
    return path, kind, size


def verify(entries):
    ok = True
    print(f'{"file":36} {"size":>11} {"mode":>5} {"bytes":>10}  result')
    for path, kind, size in entries:
        with Image.open(path) as im:
            dims, mode, fmt = im.size, im.mode, im.format
        nbytes = os.path.getsize(path)
        good = (dims == size and fmt == 'PNG' and mode == 'RGB'
                and nbytes < LIMITS[kind])
        ok &= good
        name = os.path.relpath(path, OUT).replace(os.sep, '/')
        print(f'{name:36} {dims[0]:>5}x{dims[1]:<5} '
              f'{mode:>5} {nbytes:>10,}  {"OK" if good else "FAIL"}')
    if not ok:
        sys.exit('some assets fail the Play Console requirements')


def main():
    langs = sys.argv[1:] or list(LANGS)
    unknown = [lang for lang in langs if lang not in LANGS]
    if unknown:
        sys.exit(f'unknown language(s) {unknown}; known: {list(LANGS)}')
    # The hi-res icon has no text, so one icon serves every language.
    entries = [app_icon()] if 'en' in langs else []
    for lang in langs:
        entries += [feature_graphic(lang)] + screenshots(lang)
    verify(entries)


if __name__ == '__main__':
    main()
