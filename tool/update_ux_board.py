"""Re-captures the UX board screenshots and validates docs/ for GitHub Pages.

Usage (from the repository root):

    python tool/update_ux_board.py            # re-capture + optimize + check
    python tool/update_ux_board.py --check    # only validate docs/ (CI)

Re-capturing runs the screenshot test, which renders every screen of the
app from the real widgets into docs/screens/*.png (720 x 1560):

    flutter test test/screenshots/ux_screen_map_test.dart --update-goldens

The check (no dependencies, also run by .github/workflows/deploy_ux_board.yml)
fails when:
  * an image the board references is missing, or a screenshot in
    docs/screens/ is not used by the board;
  * a screenshot is not a 720 x 1560 PNG;
  * an arrow in docs/ux_screen_map.html points at a screen id that does not
    exist, or a screen has no arrow in or out;
  * a page uses a root-absolute path ("/...") that would break under the
    /cube-mentor/ GitHub Pages subpath;
  * docs/index.html does not lead to the board, or docs/.nojekyll is missing.

Optional: with Pillow installed (pip install pillow) the PNGs are
re-encoded losslessly with optimize=True to keep docs/ small.
"""
import argparse
import os
import re
import shutil
import struct
import subprocess
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
DOCS = os.path.join(ROOT, 'docs')
BOARD = os.path.join(DOCS, 'ux_screen_map.html')
INDEX = os.path.join(DOCS, 'index.html')
SCREENS = os.path.join(DOCS, 'screens')
TEST = 'test/screenshots/ux_screen_map_test.dart'
SIZE = (720, 1560)


def capture():
    flutter = shutil.which('flutter') or shutil.which('flutter.bat')
    if not flutter:
        sys.exit('flutter is not on PATH')
    print(f'Rendering screens with {TEST} ...')
    result = subprocess.run(
        [flutter, 'test', TEST, '--update-goldens'], cwd=ROOT)
    if result.returncode:
        sys.exit('Screenshot test failed; docs/screens was not fully updated.')


def optimize():
    try:
        from PIL import Image
    except ImportError:
        print('Pillow not installed: skipping PNG optimization.')
        return
    before = after = 0
    for name in sorted(os.listdir(SCREENS)):
        if not name.endswith('.png'):
            continue
        path = os.path.join(SCREENS, name)
        before += os.path.getsize(path)
        with Image.open(path) as im:
            im.load()
            im.convert('RGB').save(path, optimize=True)
        after += os.path.getsize(path)
    print(f'Optimized PNGs: {before / 1e6:.1f} MB -> {after / 1e6:.1f} MB')


def png_size(path):
    with open(path, 'rb') as f:
        head = f.read(24)
    if head[:8] != b'\x89PNG\r\n\x1a\n':
        return None
    return struct.unpack('>II', head[16:24])


def check():
    errors = []
    board = open(BOARD, encoding='utf-8').read()

    referenced = set(re.findall(r"S\('[^']+',\s*'([^']+)'", board))
    referenced = {f'{name}.png' for name in referenced}
    files = {n for n in os.listdir(SCREENS) if n.endswith('.png')}
    for name in sorted(referenced - files):
        errors.append(f'missing screenshot docs/screens/{name}')
    for name in sorted(files - referenced):
        errors.append(f'docs/screens/{name} is not on the board')
    for name in sorted(files & referenced):
        size = png_size(os.path.join(SCREENS, name))
        if size != SIZE:
            errors.append(f'docs/screens/{name} is {size}, expected {SIZE}')

    ids = re.findall(r"S\('([^']+)',", board)
    if len(ids) != len(set(ids)):
        errors.append('duplicate screen ids on the board')
    edges = re.findall(r"E\('([^']+)',\s*'([^']+)'", board)
    linked = set()
    for a, b in edges:
        for end in (a, b):
            if end not in ids:
                errors.append(f"arrow {a} -> {b}: unknown screen '{end}'")
        linked.update((a, b))
    for screen in ids:
        if screen not in linked:
            errors.append(f"screen '{screen}' has no arrow in or out")

    for page in (BOARD, INDEX):
        html = open(page, encoding='utf-8').read()
        for attr in re.findall(r'''(?:src|href)=["'](/[^/][^"']*)''', html):
            errors.append(f'{os.path.basename(page)}: root-absolute path {attr} '
                          'breaks under the GitHub Pages subpath')
    if 'ux_screen_map.html' not in open(INDEX, encoding='utf-8').read():
        errors.append('docs/index.html does not lead to ux_screen_map.html')
    if not os.path.exists(os.path.join(DOCS, '.nojekyll')):
        errors.append('docs/.nojekyll is missing')

    if errors:
        print('UX board check failed:')
        for e in errors:
            print('  -', e)
        sys.exit(1)
    print(f'UX board OK: {len(ids)} screens, {len(edges)} arrows, '
          f'{len(files)} screenshots.')


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument('--check', action='store_true',
                        help='only validate docs/ (no re-capture)')
    args = parser.parse_args()
    if not args.check:
        capture()
        optimize()
    check()


if __name__ == '__main__':
    main()
