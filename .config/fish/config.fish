if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias xinstall="sudo xbps-install -Suvy"
alias cat="bat"
alias vim="nvim"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export MOZ_ENABLE_WAYLAND=1
export QT_APP_PLATFORM=wayland-eg1
export KITTY_ENABLE_WAYLAND=1
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TMPFILE=$HOME/.config/nnn/.lastd
export NNN_PLUG='p:preview-tui'
set -g fish_greeting
function fish_greeting
    pfetch
end
alias volume="wpctl set-volume @DEFAULT_AUDIO_SINK@"
alias lofi="mpv 'https://www.youtube.com/watch?v=jfKfPfyJRdk'" &
alias docker="podman"
alias conda="podman run -i -t continuumio/anaconda3 /bin/bash"
alias jupyter="podman run -i -t -p 8888:8888 -v $PWD:/opt/notebooks continuumio/anaconda3 /bin/bash -c 'conda install jupyter -y --quiet && mkdir -p /opt/notebooks && jupyter notebook --notebook-dir=/opt/notebooks --ip=\'*\' --port=8888 --no-browser --allow-root'"
alias icat='kitty icat'
alias clipboard='kitty +kitten clipboard'
alias unicode='kitty +kitten unicode_input | kitty +kitten clipboard'
alias hints='printf "Kitty terminal hints:\n\nOpen on web: ctrl+shift+e\nOutput file: ctrl+shift+p>f\nOpen file on vim (<filepath>,<line number>: ctrl+shift+p>n\nOpen hyperlinks: ctrl+shift+p>y"'
alias search='printf "Fish search utility:\n\nSearch directory: ctrl+alt+f\nSearch history: ctrl+r\nSearch processes: ctrl+alt+p\nSearch variables: ctrl+v\nSearch git status: ctrl+alt+s\nSearch git log: ctrl+alt+l"'
alias ls='eza --color=always --icons=auto --hyperlink -F'
alias l='eza --color=always --icons=auto -F -l -1 --hyperlink -a --long --header --inode'
alias tree='eza --color=always --icons=auto --hyperlink -T'
alias ripgrep='kitten hyperlinked_grep'
alias n='nnn -de'
alias cp='cpg -g'
alias mv='mvg -g'
