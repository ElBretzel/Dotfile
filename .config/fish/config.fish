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
set -g fish_greeting
function fish_greeting
    pfetch
end
alias volume="wpctl set-volume @DEFAULT_AUDIO_SINK@"
alias lofi="mpv 'https://www.youtube.com/watch?v=jfKfPfyJRdk'" &
alias docker="podman"
alias conda="podman run -i -t continuumio/anaconda3 /bin/bash"
alias jupyter="podman run -i -t -p 8888:8888 -v $PWD:/opt/notebooks continuumio/anaconda3 /bin/bash -c 'conda install jupyter -y --quiet && mkdir -p /opt/notebooks && jupyter notebook --notebook-dir=/opt/notebooks --ip=\'*\' --port=8888 --no-browser --allow-root'"
