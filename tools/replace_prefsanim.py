import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
INDEX_YYD = ROOT / 'scripts' / 'index.yyd'
TREE_YYD = ROOT / 'scripts' / 'tree.yyd'
SCRIPT_NAME = 'draw_prefs_highlight'

PATTERN = re.compile(
    r'draw_set_blend_mode\(bm_add\)[ \t]*;?\n'
    r'\s*draw_sprite_ext\(\s*s_prefsanim\s*,\s*0\s*,\s*'
    r'(.*?)\s*,\s*'     # \1 = x
    r'(.*?)\s*,\s*'     # \2 = y
    r'(.*?)\s*,\s*'     # \3 = xscale
    r'(.*?)\s*,\s*'     # \4 = yscale
    r'0\s*,\s*c_white\s*,\s*'
    r'(.*?)\s*\)\s*;?\n'
    r'\s*draw_set_blend_mode\(bm_normal\)[ \t]*;?',
    re.MULTILINE
)

def replace_in_file(filepath):
    content = filepath.read_text(encoding='utf-8')
    new_content, count = PATTERN.subn(
        r'draw_prefs_highlight(\1, \2, \3, \4, \5);',
        content
    )
    if count:
        filepath.write_text(new_content, encoding='utf-8')
    return count

def register_script():
    name = SCRIPT_NAME
    idx_text = INDEX_YYD.read_text(encoding='utf-8')
    if name not in idx_text.splitlines():
        idx_text = idx_text.rstrip('\n') + '\n' + name + '\n'
        INDEX_YYD.write_text(idx_text, encoding='utf-8')
        print(f'  Added to {INDEX_YYD.name}')
    else:
        print(f'  Already in {INDEX_YYD.name}')

    tree_text = TREE_YYD.read_text(encoding='utf-8')
    if f'|{name}' not in tree_text:
        tree_text = tree_text.replace('+Other\n', f'+Other\n\t|{name}\n')
        TREE_YYD.write_text(tree_text, encoding='utf-8')
        print(f'  Added to {TREE_YYD.name}')
    else:
        print(f'  Already in {TREE_YYD.name}')

def main():
    total = 0
    for gml_file in sorted(ROOT.rglob('*.gml')):
        if gml_file.name == f'{SCRIPT_NAME}.gml':
            continue
        c = replace_in_file(gml_file)
        if c:
            print(f'  {gml_file.relative_to(ROOT)}: {c} replacement(s)')
        total += c

    print(f'\nTotal: {total} replacements')
    if total == 0:
        print('(no changes needed — pattern may have already been replaced)')

    register_script()

if __name__ == '__main__':
    main()
