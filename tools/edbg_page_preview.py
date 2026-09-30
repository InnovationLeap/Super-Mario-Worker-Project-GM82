# -*- coding: utf-8 -*-
"""离线预览：按 ed_bg_page / bg_preview_draw 的同一套规则把背景选择面板画出来。

用途：GML 侧改完不用进 IDE 就能先看效果（也用来核对抠图与取景规则）。
数据全部从工程文件里解析，避免两处不一致：
  scripts/background_table_init.gml  -> 图层表（bg_addrow 调用）
  scripts/background_palette_data.gml-> 面板 3 页 12 格的编号
  scripts/bg_preview_init.gml        -> 视差标记 / 预览镜头 / 编号标记
底图用抠好的三段精灵 sprites/s_edbg_{top,mid,bot}/0.png。
输出：.dsh_tmp/page_preview_1.png ~ _3.png（以及和旧烤图的对比图）
"""
from PIL import Image, ImageDraw, ImageFont
import numpy as np
import re
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

FONT_PATH = 'C:/Windows/Fonts/ARIALNBI.TTF'   # Arial Narrow Bold Italic = fnt_label 的字体
# 步距实测（以黑框为准）：列 143（框 27/170/313/456）、行 120（框 31/151/271、下框 135/255/375）
CELL_X, CELL_Y, CELL_W, CELL_H, CELL_DX, CELL_DY = 28, 32, 138, 103, 143, 120
FRAME_COLOR = (9, 13, 33)   # 12 格统一 1px 黑框色
# 立体阴影沿用原图自带的那 3px，不再额外加深（与 ed_bg_page 一致）
STAMP_OFF = (67, 54)     # 斜标字心在格子内容里的位置（按原图实测，精灵原点在正中）

# ---------------------------------------------------------------- 数据解析
def parse_bg_table():
    src = open('scripts/background_table_init.gml', encoding='utf-8').read()
    rows = []
    for m in re.finditer(r'bg_addrow\(([^)]*)\)', src):
        args = [a.strip() for a in m.group(1).split(',')]
        if len(args) != 12:
            continue
        # 首参是表行号变量 r（调用处写 bg_addrow(r, ...)），表行号按出现顺序排
        _, bid, lay, spr, vti, ym, yv, xm, pk, dm, al, sc = args
        if not bid.isdigit():
            continue
        rows.append(dict(r=len(rows), id=int(bid), lay=int(lay), spr=spr, vti=int(vti),
                         ym=int(ym), yv=float(yv), xm=int(xm), pk=float(pk), dm=float(dm),
                         al=float(al), sc=int(sc)))
    return rows

def parse_palette():
    src = open('scripts/background_palette_data.gml', encoding='utf-8').read()
    pal = {}
    page, row = 0, 0
    for line in src.splitlines():
        # 注意 _p/_r 可能同行出现（_p = 1; _r = 0;），用 search 而非 match
        m = re.search(r'_p\s*=\s*(\d+)', line)
        if m:
            page = int(m.group(1))
        m = re.search(r'(?<![A-Za-z0-9_])_r\s*=\s*(\d+)', line)
        if m:
            row = int(m.group(1))
        m = re.match(r'\s*global\.background_palette\[_p,\s*_r\s*\*\s*4\s*\+\s*(\d+)\]\s*=\s*(\d+)', line)
        if m:
            pal[(page, row * 4 + int(m.group(1)))] = int(m.group(2))
    return pal

def parse_preview_data():
    src = open('scripts/bg_preview_init.gml', encoding='utf-8').read()
    par, camy, num = {}, {}, {}
    for m in re.finditer(r'global\.bg_pv_paralax\[(\d+)\]\s*=\s*1', src):
        par[int(m.group(1))] = 1
    for m in re.finditer(r'global\.bg_pv_camy\[(\d+)\]\s*=\s*(-?\d+)', src):
        camy[int(m.group(1))] = int(m.group(2))
    for m in re.finditer(r'global\.bg_pv_num\[(\d+)\]\s*=\s*1', src):
        num[int(m.group(1))] = 1
    return par, camy, num

ROWS = parse_bg_table()
PAL = parse_palette()
PAR, CAMY, NUM = parse_preview_data()

_bgcache = {}
def bgimg(name):
    if name not in _bgcache:
        _bgcache[name] = Image.open('backgrounds/%s.png' % name).convert('RGBA')
    return _bgcache[name]

# ---------------------------------------------------------------- 预览合成（对应 bg_preview_draw）
def preview(bid, dw=CELL_W, dh=CELL_H):
    """返回一格大小的 RGBA 图：背景 bid 在 640x480 视口 + 预览镜头下的画面。"""
    first = min(r['r'] for r in ROWS if r['id'] == bid)
    layers = [r for r in ROWS if r['id'] == bid]
    camy = CAMY.get(bid, 0)
    sxs, sys_ = dw / 640.0, dh / 480.0
    canvas = Image.new('RGBA', (dw, dh), (0, 0, 0, 255))   # 底色黑（与 GML 一致）
    for L in layers:
        spr = L['spr']
        if bid == 33 and L['lay'] == 1:
            spr = 'background_grave1'
        img = bgimg(spr)
        pw, ph = img.size
        xs, ys = 1, 1
        if L['sc'] == 2:
            ys = 480
        if L['sc'] == 3:
            xs, ys = 640, 480
        vx = L['pk'] if L['xm'] == 0 else 0.0
        if L['ym'] == 0:
            vy = L['yv'] - camy
        elif L['ym'] == 1:
            vy = (480 - L['yv']) - camy
        else:
            vy = L['yv']
        if bid == 28 and L['lay'] == 1:
            vy = (480 - 320 * ys) - camy
        tw, th = pw * xs, ph * ys
        alpha = 1.0 if L['al'] == -1 else L['al']
        if alpha <= 0:
            continue
        tile = img if (xs == 1 and ys == 1) else img.resize((int(round(tw)), int(round(th))), Image.NEAREST)
        # 铺满视口 640x480（瓦片锚在层坐标上）
        i0 = int(np.floor((0 - vx) / tw))
        while vx + i0 * tw < 640:
            tx = vx + i0 * tw
            if tx + tw > 0:
                if L['vti']:
                    j = int(np.floor((0 - vy) / th))
                    js = [j]
                    while vy + (j + 1) * th < 480:
                        j += 1
                        js.append(j)
                else:
                    js = [0]   # 不纵向平铺：只画 vy 这一片
                for j in js:
                    ty = vy + j * th
                    if ty + th <= 0 or ty >= 480:
                        continue
                    ax0, ay0 = max(0, tx), max(0, ty)
                    ax1, ay1 = min(640, tx + tw), min(480, ty + th)
                    if ax1 <= ax0 or ay1 <= ay0:
                        continue
                    u0 = int(np.floor((ax0 - tx) * pw / tw)); v0 = int(np.floor((ay0 - ty) * ph / th))
                    u1 = int(np.ceil((ax1 - tx) * pw / tw)); v1 = int(np.ceil((ay1 - ty) * ph / th))
                    u0 = max(0, u0); v0 = max(0, v0); u1 = min(pw, u1); v1 = min(ph, v1)
                    if u1 <= u0 or v1 <= v0:
                        continue
                    part = tile.crop((u0, v0, u1, v1))
                    px0 = (tx + u0 * tw / pw) * sxs
                    py0 = (ty + v0 * th / ph) * sys_
                    px1 = (tx + u1 * tw / pw) * sxs
                    py1 = (ty + v1 * th / ph) * sys_
                    w = max(1, int(round(px1 - px0)))
                    h = max(1, int(round(py1 - py0)))
                    part = part.resize((w, h), Image.BILINEAR)
                    if alpha < 1:
                        a = part.split()[3].point(lambda v, al=alpha: int(v * al))
                        part.putalpha(a)
                    canvas.alpha_composite(part, (int(round(px0)), int(round(py0))))
            i0 += 1
    return canvas

# ---------------------------------------------------------------- 文字（对应 ed_text_fit + ed_text_shadow）
_fontcache = {}
def font_for_width(txt, target_w):
    """二分找最接近目标宽度的字号（对应 ed_text_fit 的「按目标宽度反推缩放」）。"""
    lo, hi = 4, 200
    best = None
    while lo <= hi:
        mid = (lo + hi) // 2
        f = ImageFont.truetype(FONT_PATH, mid)
        w = f.getlength(txt)
        if best is None or abs(w - target_w) < abs(best[1] - target_w):
            best = (f, w, mid)
        if w < target_w:
            lo = mid + 1
        else:
            hi = mid - 1
    return best[0]

def draw_text_fit(draw, cx, cy, txt, target_w, col=(255, 255, 255, 255), orad=1, layer=None):
    f = font_for_width(txt, target_w)
    l, t, r, b = f.getbbox(txt)
    w, h = r - l, b - t
    x = cx - w / 2.0 - l
    y = cy - h / 2.0 - t
    if orad:
        for dx in (-orad, 0, orad):
            for dy in (-orad, 0, orad):
                if dx or dy:
                    draw.text((x + dx, y + dy), txt, font=f, fill=(0, 0, 0, 130))
    draw.text((x, y), txt, font=f, fill=col)

_stamp_cache = {}
def stamp():
    """视差斜标：直接用游戏里同一张精灵 sprites/s_edbg_paralax/0.png（原点在正中）。"""
    if 's' not in _stamp_cache:
        _stamp_cache['s'] = Image.open('sprites/s_edbg_paralax/0.png').convert('RGBA')
    return _stamp_cache['s']

def draw_frame(layer, x, y):
    """12 格统一 1px 黑框（与 ed_bg_page 一致：四边同色，盖掉背景外溢）。"""
    ImageDraw.Draw(layer).rectangle(
        [x - 1, y - 1, x + CELL_W, y + CELL_H], outline=FRAME_COLOR + (255,))

# ---------------------------------------------------------------- 整页
def render_page(page):
    im = Image.new('RGBA', (640, 480), (0, 0, 0, 255))
    for name, y in (('s_edbg_top', 0), ('s_edbg_mid', 32), ('s_edbg_bot', 384)):
        im.alpha_composite(Image.open('sprites/%s/0.png' % name).convert('RGBA'), (0, y))
    d = ImageDraw.Draw(im)
    for r in range(3):
        for c in range(4):
            bid = PAL.get((page, r * 4 + c), 0)
            x, y = CELL_X + c * CELL_DX, CELL_Y + r * CELL_DY
            # 与 ed_bg_page 一致：先铺黑底（空槽位也是黑的）
            d.rectangle([x, y, x + CELL_W - 1, y + CELL_H - 1], fill=(0, 0, 0, 255))
            if bid > 0:
                cell = preview(bid)
                im.alpha_composite(cell, (x, y))
                if PAR.get(bid):
                    st = stamp()
                    im.alpha_composite(st, (x + STAMP_OFF[0] - st.width // 2, y + STAMP_OFF[1] - st.height // 2))
                if NUM.get(bid):
                    draw_text_fit(d, x + 124, y + 11, str(bid), 15)
            else:
                draw_text_fit(d, x + 69, y + 38, 'COMING', 56)
                draw_text_fit(d, x + 69, y + 69, 'SOON!', 42)
            draw_frame(im, x, y)
    draw_text_fit(d, 323, 13, 'PLEASE SELECT BACKDROP SET FOR YOUR LEVEL.', 268)
    draw_text_fit(d, 330, 402, 'TO CHANGE THE WATER HEIGHT PLEASE USE BUTTONS:', 302)
    draw_text_fit(d, 489, 433, 'WEATHER', 54)
    draw_text_fit(d, 561, 433, 'BACK', 29)
    return im

OUT = 'tools/edbg_preview'
os.makedirs(OUT, exist_ok=True)
for p in range(3):
    page = render_page(p).convert('RGB')
    page.save(os.path.join(OUT, 'page_%d.png' % (p + 1)))
    print('wrote %s/page_%d.png' % (OUT, p + 1))
