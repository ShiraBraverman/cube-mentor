"""Draws the CubeMentor launcher icon (an isometric 3x3 cube on the app's
dark background) into assets/icon/. flutter_launcher_icons then builds the
Android (legacy + adaptive) and iOS icons from these files.

Run from the repository root:  python tool/generate_app_icon.py
"""
import math
from PIL import Image, ImageDraw, ImageFilter

SIZE = 1024
SS = 4  # supersampling for smooth edges
BG_TOP = (12, 17, 32)
BG_BOTTOM = (5, 7, 13)
ACCENT = (110, 139, 255)
BODY = (17, 19, 24)
TOP = (241, 244, 251)    # white (U)
LEFT = (46, 204, 113)    # green (F)
RIGHT = (255, 93, 108)   # red (R)


def lerp(a, b, t):
    return tuple(round(x + (y - x) * t) for x, y in zip(a, b))


def background(size):
    img = Image.new('RGB', (size, size))
    d = ImageDraw.Draw(img)
    for y in range(size):
        d.line([(0, y), (size, y)], fill=lerp(BG_TOP, BG_BOTTOM, y / size))
    glow = Image.new('L', (size, size), 0)
    ImageDraw.Draw(glow).ellipse(
        [size * 0.18, size * 0.14, size * 0.82, size * 0.78], fill=90)
    glow = glow.filter(ImageFilter.GaussianBlur(size * 0.12))
    img.paste(Image.new('RGB', (size, size), ACCENT), (0, 0), glow)
    return img


def cube(size, scale):
    """Transparent layer with the cube; [scale] = cube radius / size."""
    big = size * SS
    layer = Image.new('RGBA', (big, big), (0, 0, 0, 0))
    d = ImageDraw.Draw(layer)
    cx, cy, s = big / 2, big / 2 + big * 0.01, big * scale
    k = math.cos(math.radians(30))
    top, ur, lr = (cx, cy - s), (cx + s * k, cy - s / 2), (cx + s * k, cy + s / 2)
    bot, ll, ul = (cx, cy + s), (cx - s * k, cy + s / 2), (cx - s * k, cy - s / 2)
    c = (cx, cy)
    d.polygon([top, ur, lr, bot, ll, ul], fill=BODY)

    def face(origin, a_end, b_end, color, shade):
        ax, ay = a_end[0] - origin[0], a_end[1] - origin[1]
        bx, by = b_end[0] - origin[0], b_end[1] - origin[1]
        gap = 0.07
        for i in range(3):
            for j in range(3):
                pts = []
                for u, v in ((i + gap, j + gap), (i + 1 - gap, j + gap),
                             (i + 1 - gap, j + 1 - gap), (i + gap, j + 1 - gap)):
                    pts.append((origin[0] + ax * u / 3 + bx * v / 3,
                                origin[1] + ay * u / 3 + by * v / 3))
                d.polygon(pts, fill=lerp(color, BODY, shade))

    face(ul, top, c, TOP, 0.0)
    face(ul, c, ll, LEFT, 0.18)
    face(c, ur, bot, RIGHT, 0.28)
    return layer.resize((size, size), Image.LANCZOS)


def main():
    full = background(SIZE).convert('RGBA')
    full.alpha_composite(cube(SIZE, 0.34))
    full.convert('RGB').save('assets/icon/app_icon.png')
    # Adaptive icon foreground: the cube inside the 66% safe zone.
    cube(SIZE, 0.25).save('assets/icon/app_icon_foreground.png')


if __name__ == '__main__':
    main()
