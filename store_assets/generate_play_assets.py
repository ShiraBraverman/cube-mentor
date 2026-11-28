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
    return save(out, 'app_icon_512.png', 'icon', (512, 512))


# ------------------------------------------------------ feature graphic --

def feature_graphic():
    w, h = 1024, 500
    img = gradient(w, h, [(0, NAVY), (1, SLATE)], angle_deg=25)
    glow(img, (w * 0.79, h * 0.5), 250, CYAN, 55)
    glow(img, (w * 0.79, h * 0.45), 170, ACCENT, 70)

    # Cube on the right with a cyan orbit ring and scan beam.
    cx, cy, s = w * 0.79, h * 0.46, 150
    ring(img, cx, cy + s * 1.02, s * 1.18, s * 0.26, 6, CYAN, 220, blur=6)
    ring(img, cx, cy + s * 1.02, s * 1.18, s * 0.26, 3, CYAN_CORE, 180)
    beam_y = cube_on(img, cx, cy, s, beam_t=0.58)
    k = math.cos(math.radians(30))
    cyan_beam(img, cx - s * k * 1.45, cx + s * k * 1.45, beam_y, s * 2)

    d = ImageDraw.Draw(img)
    x = 64
    title = font(BLACK, 84)
    d.text((x, 132), 'CubeMentor', font=title, fill=TEXT)
    d.rounded_rectangle([x + 4, 262, x + 104, 272], radius=5, fill=CYAN)
    sub = font(SEMI, 38)
    d.text((x, 298), 'Scan & Solve', font=sub, fill=TEXT)
    d.text((x, 346), '2×2–6×6 Cubes in 3D', font=sub, fill=CYAN)
    return save(img.convert('RGB'), 'feature_graphic_1024x500.png', 'feature',
                (w, h))


# --------------------------------------------------------- screenshots --

SW, SH = 1080, 1920


def screenshot_canvas():
    img = gradient(SW, SH, [(0, (20, 30, 56)), (0.35, NAVY), (1, DEEP)])
    glow(img, (SW * 0.5, SH * 0.62), 520, ACCENT, 60)
    glow(img, (SW * 0.5, SH * 0.2), 380, CYAN, 26)
    return img


def wrap(d, text, f, max_w):
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


def headline(img, title, subtitle):
    """Headline banner: bold title (1-2 lines), cyan bar, subtitle.
    Returns the y just below it."""
    d = ImageDraw.Draw(img)
    size = 92
    while True:
        f = font(BLACK, size)
        lines = wrap(d, title, f, SW - 140)
        if len(lines) <= 2:
            break
        size -= 4
    y = 104
    for line in lines:
        tw = d.textlength(line, font=f)
        d.text(((SW - tw) / 2, y), line, font=f, fill=TEXT)
        y += int(size * 1.18)
    y += 18
    d.rounded_rectangle([SW / 2 - 56, y, SW / 2 + 56, y + 10], radius=5,
                        fill=CYAN)
    y += 36
    fs = font(REGULAR, 40)
    tw = d.textlength(subtitle, font=fs)
    d.text(((SW - tw) / 2, y), subtitle, font=fs, fill=TEXT_2)
    return y + 96


def app_frame(name, crop_ad=True):
    shot = Image.open(os.path.join(SCREENS, name)).convert('RGB')
    if shot.size != (720, 1560):
        sys.exit(f'unexpected render size {shot.size} for {name}')
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


def single_phone(img, top, name, bottom_margin=70, crop_ad=True):
    shot = app_frame(name, crop_ad)
    avail_h = SH - top - bottom_margin
    width = min(700, avail_h * shot.width / shot.height)
    phone(img, shot, (SW - width) / 2, top + 8, width)


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


def screenshots():
    paths = []

    img = screenshot_canvas()
    top = headline(img, 'Scan Any Cube with Camera',
                   'Live color detection on every sticker')
    # The scanner is full screen (no ad strip): keep its shutter row.
    single_phone(img, top, '05_scanner_camera.png', crop_ad=False)
    paths.append(save(img.convert('RGB'), 'screenshot_1.png', 'shot',
                      (SW, SH)))

    img = screenshot_canvas()
    top = headline(img, '2×2 to 6×6 Cubes Supported',
                   'Pick a size and turn it in 3D')
    top = chip_row(img, top - 30, ['2×2', '3×3', '4×4', '5×5', '6×6'],
                   '3×3') + 34
    single_phone(img, top, '01_home.png')
    paths.append(save(img.convert('RGB'), 'screenshot_2.png', 'shot',
                      (SW, SH)))

    img = screenshot_canvas()
    top = headline(img, '3D Step-by-Step Solutions',
                   'Every move animated, play, pause, step back')
    single_phone(img, top, '09_solver_step_x2.png')
    paths.append(save(img.convert('RGB'), 'screenshot_3.png', 'shot',
                      (SW, SH)))

    img = screenshot_canvas()
    top = headline(img, 'Interactive Cube Academy',
                   'Layer-by-layer lessons and a speed timer')
    width = 500
    academy, timer = app_frame('11_academy.png'), app_frame('20_timer.png')
    h = timer.height * width / timer.width
    y_back = top + 20
    y_front = SH - 76 - h
    phone(img, academy, 64, y_back, width, tilt=3)
    phone(img, timer, SW - 72 - width, y_front, width, tilt=-3)
    paths.append(save(img.convert('RGB'), 'screenshot_4.png', 'shot',
                      (SW, SH)))
    return paths


# -------------------------------------------------------------- checks --

def save(img, name, kind, size):
    path = os.path.join(OUT, name)
    img.save(path, optimize=True)
    return path, kind, size


def verify(entries):
    ok = True
    print(f'{"file":32} {"size":>11} {"mode":>5} {"bytes":>10}  result')
    for path, kind, size in entries:
        with Image.open(path) as im:
            dims, mode, fmt = im.size, im.mode, im.format
        nbytes = os.path.getsize(path)
        good = (dims == size and fmt == 'PNG' and mode == 'RGB'
                and nbytes < LIMITS[kind])
        ok &= good
        print(f'{os.path.basename(path):32} {dims[0]:>5}x{dims[1]:<5} '
              f'{mode:>5} {nbytes:>10,}  {"OK" if good else "FAIL"}')
    if not ok:
        sys.exit('some assets fail the Play Console requirements')


def main():
    entries = [app_icon(), feature_graphic()] + screenshots()
    verify(entries)


if __name__ == '__main__':
    main()
