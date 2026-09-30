# -*- coding: utf-8 -*-
"""从 sprites/s_edscenario/0.png 抠出背景选择面板的底图三段。

产物（新精灵，均为 RGBA PNG，尺寸为 32 的整数倍以便 GM8 处理）：
  sprites/s_edbg_top/0.png   640 x 32    顶部标题条（标题文字已抹除）
  sprites/s_edbg_mid/0.png   640 x 352   中部窗口 + 12 个格子黑框（格子内容挖空）
  sprites/s_edbg_bot/0.png   640 x 96    底部水位条 + 水囊 + WEATHER/BACK 按钮（文字已抹除）

三段按 y=0 / 32 / 384 摆放即与原图完全一致（除挖空的格子与抹掉的文字）。
原 s_edscenario 的 0/1/2 帧此后只作素材来源，运行时不再整张绘制。
"""
from PIL import Image
import numpy as np
import os

SRC = 'sprites/s_edscenario/0.png'
# 格子内容（不含 1px 黑框）+ 步距，全部按原图实测（以黑框为准）：
#   列：内容 x = 28 / 171 / 314 / 457，框 27/166、170/309、313/452、456/595 → 步距 143
#   行：内容 y = 32 / 152 / 272，框 31/135、151/255、271/375 → 步距 120（不是 118！）
# 步距写错会让行 1/2 的挖空与绘制整体偏 2px / 4px：框被吃掉、旧缩略图残留一条。
CELL_X0, CELL_Y0 = 28, 32
CELL_W, CELL_H = 138, 103
CELL_DX, CELL_DY = 143, 120
COLS, ROWS = 4, 3

# 需要抹除的烤字窗口 (x0, y0, x1, y1, 阈值)：条幅上的字用「按行左右插值」抹
TEXT_WINDOWS = [
    ('title',   150,   4, 500,  30, 26),
    ('water',   100, 396, 545, 420, 26),
]

# 按钮上的字：字几乎占满按钮面，改用「按钮面矩形 + 按行直线拟合底色」抹
# (名字, 按钮面矩形 x0,y0,x1,y1)
BUTTON_FACES = [
    ('weather', 462, 423, 522, 446),
    ('back',    537, 423, 590, 446),
]

def row_background(im, x0, x1, y):
    """用该行窗口左右两端（各 10px）线性插值出「无字底色」。"""
    left = im[y, x0:x0 + 10, :3].mean(axis=0)
    right = im[y, x1 - 10:x1, :3].mean(axis=0)
    xs = np.arange(x0, x1)
    t = (xs - x0) / max(1.0, (x1 - 1 - x0))
    return left[None, :] * (1 - t)[:, None] + right[None, :] * t[:, None]

def wipe_text(img, name, x0, y0, x1, y1, thresh):
    a = np.array(img).astype(float)
    mask = np.zeros((y1 - y0, x1 - x0), bool)
    for y in range(y0, y1):
        bg = row_background(a, x0, x1, y)
        diff = np.abs(a[y, x0:x1, :3] - bg).max(axis=1)
        mask[y - y0] = diff > thresh
    # 膨胀 1px，吃掉描边残留
    m = mask.copy()
    m[1:, :] |= mask[:-1, :]
    m[:-1, :] |= mask[1:, :]
    m[:, 1:] |= mask[:, :-1]
    m[:, :-1] |= mask[:, 1:]
    filled = 0
    for y in range(y0, y1):
        bg = row_background(a, x0, x1, y)
        row_mask = m[y - y0]
        if row_mask.any():
            a[y, x0:x1, :3][row_mask] = bg[row_mask]
            filled += int(row_mask.sum())
    print('  wipe %-8s window=(%d,%d)-(%d,%d) pixels=%d' % (name, x0, y0, x1, y1, filled))
    return Image.fromarray(a.astype('uint8'), 'RGBA')

def wipe_text_fit(img, name, x0, y0, x1, y1):
    """按钮面：按行用「未被字压住的像素」直线拟合底色，再把字抹成该拟合值。
    按钮的立体边在面矩形之外，不受影响。"""
    a = np.array(img).astype(float)
    v = a[:, :, :3].mean(axis=2)
    m = (v[y0:y1, x0:x1] > 200) | (v[y0:y1, x0:x1] < 112)   # 白字 + 深描边
    d = m.copy()
    for _ in range(2):                                       # 膨胀 2px，吃掉描边抗锯齿
        e = d.copy()
        e[1:, :] |= d[:-1, :]; e[:-1, :] |= d[1:, :]
        e[:, 1:] |= d[:, :-1]; e[:, :-1] |= d[:, 1:]
        d = e
    m = d
    fits = {}
    for y in range(y0, y1):
        keep = ~m[y - y0]
        xs = np.arange(x0, x1)[keep]
        if len(xs) >= 15:
            fits[y] = [np.polyfit(xs, a[y, x0:x1, c][keep], 1) for c in range(3)]
    if not fits:
        print('  wipe %-8s FAILED (no background pixels)' % name)
        return img
    ys = sorted(fits)
    for y in range(y0, y1):
        if y in fits:
            continue
        lo = max([q for q in ys if q < y], default=None)
        hi = min([q for q in ys if q > y], default=None)
        if lo is None:
            fits[y] = fits[hi]
        elif hi is None:
            fits[y] = fits[lo]
        else:
            t = (y - lo) / float(hi - lo)
            fits[y] = [fits[lo][c] * (1 - t) + fits[hi][c] * t for c in range(3)]
    filled = 0
    for y in range(y0, y1):
        row_mask = m[y - y0]
        if not row_mask.any():
            continue
        xs = np.arange(x0, x1)[row_mask]
        for c in range(3):
            a[y, x0:x1, c][row_mask] = np.polyval(fits[y][c], xs)
        filled += int(row_mask.sum())
    print('  wipe %-8s face=(%d,%d)-(%d,%d) pixels=%d' % (name, x0, y0, x1, y1, filled))
    return Image.fromarray(a.astype('uint8'), 'RGBA')

def punch_cells(img):
    a = np.array(img)
    for r in range(ROWS):
        for c in range(COLS):
            x = CELL_X0 + c * CELL_DX
            y = CELL_Y0 + r * CELL_DY
            a[y:y + CELL_H, x:x + CELL_W, 3] = 0
    print('  punch %d cells at content rects (%dx%d)' % (ROWS * COLS, CELL_W, CELL_H))
    return Image.fromarray(a, 'RGBA')

SPRITE_TXT = """frames=1
origin_x={ox}
origin_y={oy}
collision_shape=0
alpha_tolerance=0
per_frame_colliders=0
bbox_type=0
bbox_left=0
bbox_top=0
bbox_right={w1}
bbox_bottom={h1}
"""

def write_sprite_txt(name, w, h, origin_x=0, origin_y=0):
    path = os.path.join('sprites', name, 'sprite.txt')
    with open(path, 'w', encoding='utf-8', newline='') as f:
        f.write(SPRITE_TXT.format(ox=origin_x, oy=origin_y, w1=w - 1, h1=h - 1))
    print('  wrote %s' % path)

# ---------------------------------------------------------------- 斜标精灵
# 原图里的「PARALLAX INCLUDED!」是烤在格子图上的：白色 Arial Narrow 粗斜体，
# 顺时针约 43°（实测三格主轴角 42.7~42.8°），字心在格子内容里约 (67, 58)。
# 运行时用 draw_text_transformed 旋转在 GM8 上角度/锚点语义不好把握（实测转了 180°），
# 所以这里离线烤成一张小精灵，运行时 draw_sprite 直接贴，位置/角度所见即所得。
# 实测（把原图斜标反向转 43° 转正后量）：两行文字，行高 12px、行距 23px、宽约 69px，
# 字号 16 的 Arial Narrow 粗斜体正好对上（PARALLAX 宽 70、字高 11）。
STAMP_LINES = ('PARALLAX', 'INCLUDED!')
STAMP_SIZE = 16
STAMP_LINE_H = 23
STAMP_ANGLE = -43     # PIL 里负角 = 顺时针（文字朝右下读，字顶朝右上）
STAMP_FONT = 'C:/Windows/Fonts/ARIALNBI.TTF'   # 与 fnt_label（Arial Narrow 粗斜体）同款

def make_paralax_stamp():
    from PIL import ImageDraw, ImageFont
    font = ImageFont.truetype(STAMP_FONT, STAMP_SIZE)
    pad = 3
    bb = [font.getbbox(s) for s in STAMP_LINES]
    wmax = max(b[2] - b[0] for b in bb)
    tmp = Image.new('RGBA', (wmax + pad * 2, STAMP_LINE_H + (bb[1][3] - bb[1][1]) + pad * 2), (0, 0, 0, 0))
    d = ImageDraw.Draw(tmp)
    # 深色描边（8 方向）→ 白字，贴近原图的「白字 + 细暗边」
    for i, s in enumerate(STAMP_LINES):
        l, t, r, b = bb[i]
        x = pad + (wmax - (r - l)) / 2.0 - l
        y = pad + i * STAMP_LINE_H - t
        for dx in (-1, 0, 1):
            for dy in (-1, 0, 1):
                if dx or dy:
                    d.text((x + dx, y + dy), s, font=font, fill=(0, 0, 0, 180))
        d.text((x, y), s, font=font, fill=(255, 255, 255, 255))
    rot = tmp.rotate(STAMP_ANGLE, resample=Image.BICUBIC, expand=True)
    out_dir = os.path.join('sprites', 's_edbg_paralax')
    if not os.path.isdir(out_dir):
        os.makedirs(out_dir)
    rot.save(os.path.join(out_dir, '0.png'))
    write_sprite_txt('s_edbg_paralax', rot.width, rot.height, origin_x=rot.width // 2, origin_y=rot.height // 2)
    print('  wrote %s/0.png %s (origin 中心)' % (out_dir, rot.size))
    return rot.size

def clean_source_pages():
    """把源图 s_edscenario 帧 0/1/2 里「背景选择的内容」清掉：
    12 格旧缩略图挖空 + 标题/水位提示/WEATHER/BACK 四处烤字抹除，
    只留面板本身的框、条、按钮。天气页（帧 3）不动。
    清完这三帧就只剩面板装饰，不会再有人误用旧缩略图（原图在 git 历史里仍可取回）。"""
    for page in (0, 1, 2):
        path = os.path.join('sprites', 's_edscenario', '%d.png' % page)
        img = Image.open(path).convert('RGBA')
        for (name, x0, y0, x1, y1, th) in TEXT_WINDOWS:
            img = wipe_text(img, name, x0, y0, x1, y1, th)
        for (name, x0, y0, x1, y1) in BUTTON_FACES:
            img = wipe_text_fit(img, name, x0, y0, x1, y1)
        img = punch_cells(img)
        img.save(path)
        print('  cleaned %s' % path)

def main():
    src = Image.open(SRC).convert('RGBA')
    assert src.size == (640, 480), src.size
    img = src
    for (name, x0, y0, x1, y1, th) in TEXT_WINDOWS:
        img = wipe_text(img, name, x0, y0, x1, y1, th)
    for (name, x0, y0, x1, y1) in BUTTON_FACES:
        img = wipe_text_fit(img, name, x0, y0, x1, y1)
    img = punch_cells(img)

    pieces = [('s_edbg_top', 0, 32), ('s_edbg_mid', 32, 384), ('s_edbg_bot', 384, 480)]
    for name, y0, y1 in pieces:
        out_dir = os.path.join('sprites', name)
        if not os.path.isdir(out_dir):
            os.makedirs(out_dir)
        part = img.crop((0, y0, 640, y1))
        part.save(os.path.join(out_dir, '0.png'))
        write_sprite_txt(name, 640, y1 - y0)
        print('  wrote %s/0.png %s' % (out_dir, part.size))

    # 自检：三段拼回去，与原图比较；差异必须只落在挖空格 + 抹字窗口内
    rebuilt = Image.new('RGBA', (640, 480), (0, 0, 0, 0))
    for name, y0, y1 in pieces:
        rebuilt.paste(Image.open(os.path.join('sprites', name, '0.png')), (0, y0))
    a = np.array(src).astype(int)
    b = np.array(rebuilt).astype(int)
    d = np.abs(a - b).max(axis=2)
    allow = np.zeros((480, 640), bool)
    for r in range(ROWS):
        for c in range(COLS):
            x = CELL_X0 + c * CELL_DX
            y = CELL_Y0 + r * CELL_DY
            allow[y:y + CELL_H, x:x + CELL_W] = True
    for (name, x0, y0, x1, y1, th) in TEXT_WINDOWS:
        allow[y0 - 2:y1 + 2, x0 - 2:x1 + 2] = True
    for (name, x0, y0, x1, y1) in BUTTON_FACES:
        allow[y0 - 2:y1 + 2, x0 - 2:x1 + 2] = True
    bad = (d > 0) & (~allow)
    print('  self-check: unexpected diff pixels = %d' % int(bad.sum()))
    if bad.any():
        ys, xs = np.where(bad)
        print('    bbox', xs.min(), ys.min(), xs.max(), ys.max())

    make_paralax_stamp()
    clean_source_pages()

main()
