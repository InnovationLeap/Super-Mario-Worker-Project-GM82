# AGENTS.md – GM8 语法规则

## GM8 语法限制

- `var` 声明不能同时赋值，必须分开写（`var x; x = value;`），且 `var` 不能出现在 `if`/`while` 等块内部，只能在脚本/函数顶部声明。
- 注册新脚本：新建 `.gml` 文件后，必须在 `scripts/index.yyd` 中添加脚本名（文件名不含扩展名，占一行），同时在 `scripts/tree.yyd` 中添加树节点（`|脚本名` 放在对应分组 `+分组名` 下），才能在 GM8.2 IDE 中显示。
