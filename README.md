# macOS Dotfiles

个人 macOS 配置仓库，主要使用 **GNU Stow** 管理配置文件。

## 已安装工具

### 终端与 Shell

- Ghostty
- Zsh
- Starship
- Zellij
- Atuin
- fzf
- zoxide

### 文件与搜索

- eza
- bat
- fd
- ripgrep
- Yazi

### Git

- Lazygit
- git-delta

### 系统工具

- Fastfetch
- btop
- dust
- duf
- procs

### 其他

- glow
- tlrc
- Hammerspoon

## 当前配置
### Ghostty

- Dracula 主题
- JetBrains Mono Nerd Font
- 半透明背景
- 隐藏标题栏

### Zsh

主要配置：

- zoxide：目录快速跳转
- fzf：模糊搜索
- Atuin：Shell 历史搜索
- Starship：Shell Prompt
- bat：替代 cat
- eza：替代 ls

```zsh
eval "$(zoxide init zsh)"
source <(fzf --zsh)
eval "$(atuin init zsh)"

export BAT_THEME="Dracula"

alias cat='bat --paging=never'
alias ls='eza --icons=auto'
alias ll='eza -lah --icons=auto'
alias la='eza -a --icons=auto'
alias tree='eza --tree --level=2 --icons=auto'

eval "$(starship init zsh)"

Starship
- Dracula 配色
- 显示用户名、当前目录、Git 状态、开发环境和时间

Zellij
- Dracula 配色
- 自定义 zjstatus 状态栏
- 完整 Pane 边框
- Option + H/J/K/L 切换 Pane
- Option + N 新建 Pane

Fastfetch
- Dracula 配色
- 图片 Agent Card
- 显示系统、CPU、内存、磁盘、电池、Shell 和 Terminal

btop
- Dracula 主题
- 透明背景

Git
- 使用 git-delta 增强 diff
- side-by-side 模式
- zdiff3 冲突显示

Hammerspoon
窗口快捷键：
- ⌃⌥⌘ ←：左半屏
- ⌃⌥⌘ →：右半屏
- ⌃⌥⌘ ↑：最大化
- ⌃⌥⌘ 1：左侧 60%
- ⌃⌥⌘ 2：右侧 40%
应用快捷键：
- ⌃⌥⌘ C：ChatGPT
- ⌃⌥⌘ G：Ghostty
- ⌃⌥⌘ V：Visual Studio Code
- ⌃⌥⌘ B：Google Chrome

GNU Stow 管理的配置
- ghostty
- atuin
- btop
- fastfetch
- git
- hammerspoon
- starship
- zellij
- zsh
主题
整体主要使用 Dracula 配色。
