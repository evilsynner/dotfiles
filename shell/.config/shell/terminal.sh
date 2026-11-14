# ============================================================
# Source this from ~/.bashrc or ~/.zshrc (PC and Termux):
#   [ -f ~/.config/shell/terminal.sh ] && . ~/.config/shell/terminal.sh
# ============================================================

# Free Ctrl-s / Ctrl-q (otherwise the terminal freezes on Ctrl-s
# instead of Neovim saving).
[ -t 0 ] && stty -ixon

# When tmux runs inside kitty, tell kitty so it hands
# Ctrl-h/j/k/l and Alt-h/j/k/l to tmux instead of using them.
tmux() {
    if [ -n "$KITTY_WINDOW_ID" ] && [ -z "$TMUX" ]; then
        printf '\033]1337;SetUserVar=IN_TMUX=%s\007' "$(printf 1 | base64)"
        command tmux "$@"
        local rc=$?
        printf '\033]1337;SetUserVar=IN_TMUX\007'
        return $rc
    fi
    command tmux "$@"
}
