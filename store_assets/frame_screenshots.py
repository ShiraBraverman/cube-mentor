"""Wraps raw phone screenshots in CubeMentor store frames with a localized
marketing caption, ready for Google Play (1080 x 1920 portrait, 9:16).

Layout: brand gradient background, caption (1-2 lines) on top, the
screenshot inside a rounded phone bezel below, with a soft glow.

Usage (from the repository root):

    python store_assets/frame_screenshots.py \\
        --in store_assets/raw/en --out store_assets/framed/en --locale en

Raw screenshots are matched to captions by file name order: the first file
(sorted by name) gets caption 1, and so on. Name them e.g.
01_scan.png, 02_solve.png, 03_academy.png, 04_daily.png, 05_timer.png.

Capturing 01_scan.png: the scanner is full screen (the camera covers the
whole display, the face indicator / flashlight float along the top edge and
the face strip / shutter along the bottom). Take an uncropped, full-height
screenshot (adb exec-out screencap -p > 01_scan.png) with a cube filling the
large center grid, so the live grid colors show; the frame keeps the phone's
own tall aspect ratio, and a scan shot that looks cropped is flagged below.

Captions live in CAPTIONS below (one list per locale; English fallback).
Non-Latin scripts need a font that covers them: pass --font with a TTF
(e.g. Noto Sans CJK for ja/ko/zh, Noto Sans Hebrew/Arabic, Noto Sans
Devanagari/Bengali/Myanmar). Right-to-left captions (he, ar) need
`pip install python-bidi` (and arabic-reshaper for Arabic) to render in
visual order; the script uses them when installed.

Requires Pillow (pip install pillow).
"""
import argparse
import glob
import os
import sys

from PIL import Image, ImageDraw, ImageFilter, ImageFont

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                '..', 'tool'))
try:
    from brand_art import ACCENT, SCAN, background  # noqa: E402
except ImportError:  # standalone copy of this script
    ACCENT, SCAN = (110, 139, 255), (62, 230, 176)

    def background(w, h, **_):
        top, bottom = (14, 20, 40), (4, 6, 12)
        img = Image.new('RGB', (w, h))
        d = ImageDraw.Draw(img)
        for y in range(h):
            t = y / h
            d.line([(0, y), (w, y)], fill=tuple(
                round(a + (b - a) * t) for a, b in zip(top, bottom)))
        return img.convert('RGBA')

OUT_W, OUT_H = 1080, 1920

# Five captions per locale, in screenshot order:
# scan, 3D solve guide, academy, daily challenge, speed timer.
CAPTIONS = {
    'en': ['Scan your cube with the camera', 'Solve it step by step in 3D',
           'Learn from beginner to pro', 'Daily challenge & streak',
           'Speed timer with ao5 / ao12'],
    'he': ['סורקים את הקובייה במצלמה', 'פותרים צעד אחר צעד בתלת־ממד',
           'לומדים ממתחילים ועד מקצוענים', 'אתגר יומי ורצף ימים',
           'טיימר מהירות עם ממוצעים'],
    'es': ['Escanea tu cubo con la cámara', 'Resuélvelo paso a paso en 3D',
           'Aprende de principiante a experto', 'Reto diario y racha',
           'Cronómetro con ao5 / ao12'],
    'pt': ['Digitaliza o cubo com a câmara', 'Resolve passo a passo em 3D',
           'Aprende do básico ao avançado', 'Desafio diário e sequência',
           'Cronómetro com ao5 / ao12'],
    'pt_BR': ['Escaneie o cubo com a câmera', 'Resolva passo a passo em 3D',
              'Aprenda do iniciante ao avançado', 'Desafio diário e sequência',
              'Cronômetro com ao5 / ao12'],
    'id': ['Pindai kubusmu dengan kamera', 'Selesaikan langkah demi langkah 3D',
           'Belajar dari pemula hingga mahir', 'Tantangan harian & streak',
           'Timer cepat dengan ao5 / ao12'],
    'hi': ['कैमरे से अपना क्यूब स्कैन करें', '3D में कदम-दर-कदम हल करें',
           'शुरुआती से प्रो तक सीखें', 'दैनिक चुनौती और स्ट्रीक',
           'ao5 / ao12 के साथ स्पीड टाइमर'],
    'fil': ['I-scan ang cube gamit ang camera', 'Lutasin nang hakbang-hakbang sa 3D',
            'Matuto mula baguhan hanggang pro', 'Daily challenge at streak',
            'Speed timer na may ao5 / ao12'],
    'ar': ['امسح مكعبك بالكاميرا', 'حلّه خطوة بخطوة بالأبعاد الثلاثية',
           'تعلّم من المبتدئ إلى المحترف', 'تحدٍّ يومي وسلسلة أيام',
           'مؤقت سرعة مع ao5 / ao12'],
    'fr': ['Scannez votre cube avec la caméra', 'Résolvez-le pas à pas en 3D',
           'Du débutant au pro', 'Défi du jour et série',
           'Chrono avec ao5 / ao12'],
    'de': ['Scanne deinen Würfel mit der Kamera', 'Schritt für Schritt in 3D lösen',
           'Vom Anfänger zum Profi', 'Tages-Challenge & Serie',
           'Speed-Timer mit ao5 / ao12'],
    'ru': ['Сканируйте кубик камерой', 'Собирайте шаг за шагом в 3D',
           'От новичка до профи', 'Испытание дня и серия',
           'Таймер со средними ao5 / ao12'],
    'pl': ['Zeskanuj kostkę aparatem', 'Układaj krok po kroku w 3D',
           'Od początkującego do mistrza', 'Wyzwanie dnia i seria',
           'Stoper z ao5 / ao12'],
    'tr': ['Küpünü kamerayla tara', '3D adım adım çöz',
           'Başlangıçtan ustalığa öğren', 'Günlük görev ve seri',
           'ao5 / ao12 ile hız sayacı'],
    'ja': ['カメラでキューブをスキャン', '3Dで一手ずつ解き方を案内',
           '初心者から上級者まで学べる', 'デイリーチャレンジと連続記録',
           'ao5 / ao12 対応タイマー'],
    'ko': ['카메라로 큐브 스캔', '3D로 한 단계씩 풀기', '초보부터 고수까지',
           '데일리 챌린지와 연속 기록', 'ao5 / ao12 스피드 타이머'],
    'zh': ['用相机扫描魔方', '3D 逐步还原指导', '从入门到高手',
           '每日挑战与连续打卡', '支持 ao5 / ao12 的计时器'],
    'zh_TW': ['用相機掃描魔術方塊', '3D 逐步還原指導', '從入門到高手',
              '每日挑戰與連續紀錄', '支援 ao5 / ao12 的計時器'],
    'vi': ['Quét khối Rubik bằng camera', 'Giải từng bước trong 3D',
           'Học từ cơ bản đến nâng cao', 'Thử thách hằng ngày & chuỗi ngày',
           'Đồng hồ bấm giờ ao5 / ao12'],
    'my': ['ကင်မရာဖြင့် ကုဗကို စကင်ဖတ်ပါ', '3D ဖြင့် အဆင့်လိုက် ဖြေရှင်းပါ',
           'အစပြုသူမှ ကျွမ်းကျင်သူအထိ', 'နေ့စဉ် စိန်ခေါ်မှုနှင့် ဆက်တိုက်ရက်',
           'ao5 / ao12 ပါ အမြန်နှုန်း တိုင်မာ'],
    'bn': ['ক্যামেরা দিয়ে কিউব স্ক্যান করুন', '3D-তে ধাপে ধাপে সমাধান',
           'শুরু থেকে প্রো পর্যন্ত শিখুন', 'দৈনিক চ্যালেঞ্জ ও স্ট্রিক',
           'ao5 / ao12 সহ স্পিড টাইমার'],
    'tt': ['Кубикны камера белән сканерлагыз', '3D-да адымлап җыегыз',
           'Башлап җибәрүчедән осталыкка', 'Көнлек сынау һәм серия',
           'ao5 / ao12 белән таймер'],
}

RTL = {'he', 'ar'}

FONTS = ['C:/Windows/Fonts/segoeuib.ttf', 'C:/Windows/Fonts/arialbd.ttf',
         '/System/Library/Fonts/Supplemental/Arial Bold.ttf',
         '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf']


def load_font(size, override=None):
    for path in ([override] if override else []) + FONTS:
        if path and os.path.exists(path):
            return ImageFont.truetype(path, size)
    return ImageFont.load_default()


def visual(text, locale):
    """Right-to-left captions in visual order when python-bidi is present."""
    if locale.split('_')[0] not in RTL:
        return text
    try:
        if locale.startswith('ar'):
            import arabic_reshaper
            text = arabic_reshaper.reshape(text)
        from bidi.algorithm import get_display
        return get_display(text)
    except ImportError:
        print('warning: install python-bidi (and arabic-reshaper) for RTL')
        return text


def wrap(draw, text, font, max_width):
    """Greedy word wrap; scripts without spaces fall back to characters."""
    words = text.split(' ') if ' ' in text else list(text)
    joiner = ' ' if ' ' in text else ''
    lines, line = [], ''
    for w in words:
        probe = (line + joiner + w) if line else w
        if draw.textlength(probe, font=font) <= max_width:
            line = probe
        else:
            if line:
                lines.append(line)
            line = w
    if line:
        lines.append(line)
    return lines


def frame(shot_path, caption, locale, font_override=None):
    img = background(OUT_W, OUT_H, glow_center=(0.5, 0.62), glow_radius=0.6)
    d = ImageDraw.Draw(img)

    # Caption: up to two lines, shrinking until it fits.
    size = 82
    while True:
        font = load_font(size, font_override)
        lines = wrap(d, caption, font, OUT_W - 140)
        if len(lines) <= 2 or size <= 44:
            break
        size -= 4
    y = 120
    for line in lines:
        shown = visual(line, locale)
        w = d.textlength(shown, font=font)
        d.text(((OUT_W - w) / 2, y), shown, font=font, fill=(244, 247, 255))
        y += int(size * 1.22)
    d.rounded_rectangle([OUT_W / 2 - 48, y + 14, OUT_W / 2 + 48, y + 24],
                        radius=5, fill=SCAN)

    # Phone: the screenshot scaled into a rounded bezel.
    shot = Image.open(shot_path).convert('RGB')
    top = y + 70
    max_h = OUT_H - top - 60
    max_w = OUT_W - 220
    scale = min(max_w / shot.width, max_h / shot.height)
    sw, sh = int(shot.width * scale), int(shot.height * scale)
    shot = shot.resize((sw, sh), Image.LANCZOS)
    bezel = 18
    px = (OUT_W - sw) // 2
    py = top + (max_h - sh) // 2
    radius = int(sw * 0.075)

    glow = Image.new('L', (OUT_W, OUT_H), 0)
    ImageDraw.Draw(glow).rounded_rectangle(
        [px - bezel, py - bezel, px + sw + bezel, py + sh + bezel],
        radius=radius + bezel, fill=150)
    glow = glow.filter(ImageFilter.GaussianBlur(46))
    img.paste(Image.new('RGBA', (OUT_W, OUT_H), ACCENT + (255,)), (0, 0), glow)

    d = ImageDraw.Draw(img)
    d.rounded_rectangle(
        [px - bezel, py - bezel, px + sw + bezel, py + sh + bezel],
        radius=radius + bezel, fill=(10, 12, 18), outline=(70, 80, 110), width=3)
    mask = Image.new('L', (sw, sh), 0)
    ImageDraw.Draw(mask).rounded_rectangle([0, 0, sw, sh], radius=radius,
                                           fill=255)
    img.paste(shot, (px, py), mask)
    return img.convert('RGB')


def check_full_screen_scan(path):
    """The full-screen scanner only reads right uncropped: phone screens are
    at least 16:9 tall, so a squatter scan shot was probably cut down to the
    old boxed preview."""
    with Image.open(path) as shot:
        ratio = shot.height / shot.width
    if ratio < 16 / 9 - 0.01:
        print(f'warning: {os.path.basename(path)} is {ratio:.2f}:1; capture '
              'the full-screen scanner uncropped (top bar to shutter)')


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--in', dest='src', required=True,
                    help='folder of raw screenshots (png/jpg)')
    ap.add_argument('--out', required=True, help='output folder')
    ap.add_argument('--locale', default='en', help=', '.join(CAPTIONS))
    ap.add_argument('--font', default=None, help='TTF covering the script')
    ap.add_argument('--captions', default=None,
                    help='override: captions separated by "|"')
    args = ap.parse_args()

    captions = (args.captions.split('|') if args.captions
                else CAPTIONS.get(args.locale, CAPTIONS['en']))
    shots = sorted(p for ext in ('png', 'jpg', 'jpeg')
                   for p in glob.glob(os.path.join(args.src, f'*.{ext}')))
    if not shots:
        sys.exit(f'no screenshots in {args.src}')
    os.makedirs(args.out, exist_ok=True)
    for i, path in enumerate(shots):
        if i == 0:
            check_full_screen_scan(path)
        caption = captions[i % len(captions)]
        out = os.path.join(args.out, os.path.basename(path).rsplit('.', 1)[0]
                           + '.png')
        frame(path, caption, args.locale, args.font).save(out)
        print('framed', out)


if __name__ == '__main__':
    main()
