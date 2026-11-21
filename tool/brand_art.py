"""Shared CubeMentor brand art: a glossy isometric 3x3 cube framed by
glowing camera viewfinder corners with a luminous scan beam across the
tiles. Used by tool/generate_app_icon.py (launcher icons) and
tool/generate_feature_graphic.py (Google Play feature graphic).

Everything is drawn with Pillow at 4x supersampling and scaled down.
"""
import math
from PIL import Image, ImageChops, ImageDraw, ImageFilter

SS = 4  # supersampling for smooth edges

BG_TOP = (14, 20, 40)
BG_BOTTOM = (4, 6, 12)
ACCENT = (110, 139, 255)   # app accent (indigo)
SCAN = (62, 230, 176)      # app accentSecondary (mint) - the scanner color
SCAN_CORE = (214, 255, 241)
BODY = (12, 13, 18)

STICKERS = {
    'W': (246, 248, 255),
    'Y': (255, 214, 48),
    'R': (255, 64, 84),
    'O': (255, 140, 26),
    'B': (40, 120, 255),
    'G': (24, 210, 110),
}

# A lively scrambled look (centers keep the Western scheme: U white,
# F green, R red), row by row as seen on each face.
TOP_FACE = ['WBW', 'RWY', 'WOG']
LEFT_FACE = ['GYG', 'WGR', 'GBO']
RIGHT_FACE = ['ROR', 'GRB', 'YRW']


def lerp(a, b, t):
    return tuple(round(x + (y - x) * t) for x, y in zip(a, b))


def vertical_gradient(w, h, top, bottom):
    col = Image.new('RGB', (1, h))
    for y in range(h):
        col.putpixel((0, y), lerp(top, bottom, y / max(1, h - 1)))
    return col.resize((w, h))


def background(w, h, glow_center=(0.5, 0.46), glow_radius=0.36):
    """Deep navy gradient with a soft indigo glow behind the cube."""
    img = vertical_gradient(w, h, BG_TOP, BG_BOTTOM)
    glow = Image.new('L', (w, h), 0)
    r = min(w, h) * glow_radius
    cx, cy = w * glow_center[0], h * glow_center[1]
    ImageDraw.Draw(glow).ellipse([cx - r, cy - r, cx + r, cy + r], fill=120)
    glow = glow.filter(ImageFilter.GaussianBlur(r * 0.45))
    img.paste(Image.new('RGB', (w, h), ACCENT), (0, 0), glow)
    return img.convert('RGBA')


def _quad(origin, a, b, u0, v0, u1, v1):
    """Corners of the (u, v) box on a face spanned by vectors a and b."""
    pts = []
    for u, v in ((u0, v0), (u1, v0), (u1, v1), (u0, v1)):
        pts.append((origin[0] + a[0] * u + b[0] * v,
                    origin[1] + a[1] * u + b[1] * v))
    return pts


def _rounded_quad_mask(size, pts, radius):
    """Mask of a quad with softly rounded corners (draw, blur, threshold)."""
    m = Image.new('L', size, 0)
    ImageDraw.Draw(m).polygon(pts, fill=255)
    if radius > 0:
        m = m.filter(ImageFilter.GaussianBlur(radius))
        m = m.point(lambda p: 255 if p > 128 else 0)
    return m


def cube_layer(size, cx, cy, s, beam_t=0.56):
    """RGBA layer (size x size, already downsampled) with the cube of radius
    [s] (px) centered at ([cx], [cy]) and the scan beam at [beam_t] of the
    cube's height (0 top, 1 bottom)."""
    big = size * SS
    cx, cy, s = cx * SS, cy * SS, s * SS
    layer = Image.new('RGBA', (big, big), (0, 0, 0, 0))
    d = ImageDraw.Draw(layer)
    k = math.cos(math.radians(30))
    top, ur, lr = (cx, cy - s), (cx + s * k, cy - s / 2), (cx + s * k, cy + s / 2)
    bot, ll, ul = (cx, cy + s), (cx - s * k, cy + s / 2), (cx - s * k, cy - s / 2)
    c = (cx, cy)

    # Drop shadow under the cube.
    shadow = Image.new('L', (big, big), 0)
    ImageDraw.Draw(shadow).ellipse(
        [cx - s * 0.95, cy + s * 0.78, cx + s * 0.95, cy + s * 1.18], fill=150)
    shadow = shadow.filter(ImageFilter.GaussianBlur(s * 0.12))
    layer.paste(Image.new('RGBA', (big, big), (0, 0, 0, 255)), (0, 0), shadow)

    d.polygon([top, ur, lr, bot, ll, ul], fill=BODY + (255,))

    def face(origin, a_end, b_end, rows, shade, gloss):
        a = ((a_end[0] - origin[0]) / 3, (a_end[1] - origin[1]) / 3)
        b = ((b_end[0] - origin[0]) / 3, (b_end[1] - origin[1]) / 3)
        gap = 0.085
        for j in range(3):
            for i in range(3):
                color = STICKERS[rows[j][i]]
                base = lerp(color, (0, 0, 0), shade)
                pts = _quad(origin, a, b, i + gap, j + gap, i + 1 - gap, j + 1 - gap)
                mask = _rounded_quad_mask((big, big), pts, s * 0.012)
                # Sticker body with a slight darkening toward its far edge.
                tile = Image.new('RGBA', (big, big), base + (255,))
                layer.paste(tile, (0, 0), mask)
                # Glossy highlight: a lighter inset band on the near half.
                hi = _quad(origin, a, b, i + gap * 1.8, j + gap * 1.8,
                           i + 0.62, j + 0.46)
                hm = _rounded_quad_mask((big, big), hi, s * 0.01)
                hm = hm.filter(ImageFilter.GaussianBlur(s * 0.012))
                hm = hm.point(lambda p, g=gloss: int(p * g))
                layer.paste(Image.new('RGBA', (big, big), (255, 255, 255, 255)),
                            (0, 0), hm)

    face(ul, top, c, TOP_FACE, 0.0, 0.42)     # U: a = toward top, b = toward c
    face(ul, c, ll, LEFT_FACE, 0.08, 0.32)
    face(c, ur, bot, RIGHT_FACE, 0.2, 0.26)

    # Rim light along the top silhouette edges.
    rim = Image.new('L', (big, big), 0)
    ImageDraw.Draw(rim).line([ul, top, ur], fill=200, width=int(s * 0.02))
    rim = rim.filter(ImageFilter.GaussianBlur(s * 0.015))
    layer.paste(Image.new('RGBA', (big, big), (255, 255, 255, 255)), (0, 0), rim)

    # Scan: tiles above the beam tinted as "already read", then the beam.
    silhouette = Image.new('L', (big, big), 0)
    ImageDraw.Draw(silhouette).polygon([top, ur, lr, bot, ll, ul], fill=255)
    beam_y = (cy - s) + 2 * s * beam_t
    scanned = Image.new('L', (big, big), 0)
    ImageDraw.Draw(scanned).rectangle([0, 0, big, beam_y], fill=255)
    fade = Image.new('L', (big, big), 0)
    fd = ImageDraw.Draw(fade)
    span = s * 0.9
    for y in range(int(beam_y - span), int(beam_y) + 1):
        fd.line([(0, y), (big, y)], fill=int(46 * (1 - (beam_y - y) / span)))
    tint = ImageChops.multiply(ImageChops.multiply(scanned, silhouette), fade)
    layer.paste(Image.new('RGBA', (big, big), SCAN + (255,)), (0, 0), tint)

    out = layer.resize((size, size), Image.LANCZOS)
    return out, beam_y / SS


def viewfinder_layer(size, box, beam_y, beam_x=None, thickness=None,
                     arm=None, glow=True):
    """Glowing L-shaped camera corners around [box] (x0, y0, x1, y1) and a
    luminous scan line at [beam_y] spanning [beam_x] (x0, x1)."""
    big = size * SS
    x0, y0, x1, y1 = (v * SS for v in box)
    w = x1 - x0
    t = (thickness or w * 0.036) * (SS if thickness else 1)
    L = (arm or w * 0.22) * (SS if arm else 1)
    lines = Image.new('L', (big, big), 0)
    d = ImageDraw.Draw(lines)

    def corner(px, py, dx, dy):
        d.line([(px, py + dy * L), (px, py), (px + dx * L, py)],
               fill=255, width=int(t), joint='curve')
        for qx, qy in ((px, py + dy * L), (px + dx * L, py), (px, py)):
            d.ellipse([qx - t / 2, qy - t / 2, qx + t / 2, qy + t / 2], fill=255)

    corner(x0, y0, 1, 1)
    corner(x1, y0, -1, 1)
    corner(x0, y1, 1, -1)
    corner(x1, y1, -1, -1)

    layer = Image.new('RGBA', (big, big), (0, 0, 0, 0))
    if glow:
        for radius, gain in ((t * 3.2, 1.0), (t * 1.2, 1.0)):
            halo = lines.filter(ImageFilter.GaussianBlur(radius))
            layer.paste(Image.new('RGBA', (big, big), SCAN + (255,)), (0, 0),
                        halo.point(lambda p, g=gain: min(255, int(p * g * 1.6))))
    layer.paste(Image.new('RGBA', (big, big), SCAN + (255,)), (0, 0), lines)

    # Scan beam: wide soft glow, bright core, white-hot center line.
    by = beam_y * SS
    bx0, bx1 = ((beam_x[0] * SS, beam_x[1] * SS) if beam_x
                else (x0 + t * 1.2, x1 - t * 1.2))
    for spread, alpha, color in ((w * 0.2, 110, SCAN), (w * 0.06, 210, SCAN),
                                 (w * 0.018, 255, SCAN),
                                 (w * 0.008, 255, SCAN_CORE)):
        m = Image.new('L', (big, big), 0)
        ImageDraw.Draw(m).rounded_rectangle(
            [bx0, by - spread / 2, bx1, by + spread / 2],
            radius=spread / 2, fill=alpha)
        m = m.filter(ImageFilter.GaussianBlur(max(1, spread * 0.35)))
        # Fade the beam out toward both ends.
        ends = Image.new('L', (big, big), 0)
        ed = ImageDraw.Draw(ends)
        n = 64
        for i in range(n):
            xa = bx0 + (bx1 - bx0) * i / n
            xb = bx0 + (bx1 - bx0) * (i + 1) / n
            f = math.sin(math.pi * (i + 0.5) / n) ** 0.6
            ed.rectangle([xa, 0, xb, big], fill=int(255 * f))
        m = ImageChops.multiply(m, ends)
        layer.paste(Image.new('RGBA', (big, big), color + (255,)), (0, 0), m)
    return layer.resize((size, size), Image.LANCZOS)


def scan_emblem(size, scale=1.0, transparent=False):
    """The full emblem (cube + viewfinder + beam) on a [size] square canvas;
    [scale] shrinks it around the center (adaptive icon safe zone)."""
    canvas = (Image.new('RGBA', (size, size), (0, 0, 0, 0)) if transparent
              else background(size, size))
    s = size * 0.315 * scale
    cx, cy = size / 2, size / 2 + size * 0.005 * scale
    cube, beam_y = cube_layer(size, cx, cy, s)
    half = size * 0.415 * scale
    box = (cx - half, cy - half, cx + half, cy + half)
    canvas.alpha_composite(cube)
    canvas.alpha_composite(viewfinder_layer(size, box, beam_y))
    return canvas
