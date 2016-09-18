# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

set fish_greeting (set_color brown)-- (whoami)@(hostname) --(set_color normal)

set PATH (cope_path) /home/v/work/moz-git-tools /opt/android-sdk/platform-tools /home/v/work/b2g-hamachi/B2G/tools/update-tools/bin/linux-x86 /opt/sunbird /opt/play /home/v/idea-IU-141.1532.4/bin /usr/local/heroku/bin $PATH /opt/jdk1.6.0_45/bin /home/v/work/b2g-hamachi/B2G/prebuilt/linux-x86/toolchain/arm-eabi-4.3.1/bin/ /home/v/Downloads/android-sdk-linux/platform-tools /home/v/.gem/ruby/2.1.0/bin /usr/local/bin/

set PATH $PATH (ruby -rubygems -e "puts Gem.user_dir")/bin

set PATH $PATH ~/go/bin
set PATH $PATH ~/bin
set PATH $PATH ~/.cabal/bin/
set PATH $PATH /usr/bin/vendor_perl/

# fix IDEA
set PATH /usr/lib/jvm/default/bin $PATH ~/go/bin

#source /home/v/.rvm/scripts/rvm

set -x GOPATH ~/dev/dtr/go
set -x GOBIN ~/dev/dtr/go/bin
set -x PATH $PATH ~/dev/dtr/go/bin

alias less 'less -R'
#alias chromium 'chromium --proxy-server=localhost:8118'

set -x LC_ALL 'en_US.UTF-8'
set -x LANG 'en_US.UTF-8'

# dirty hack because if these variables are not set before we source the keychain config, it fails
set -x SSH_AUTH_SOCK ''
set -x SSH_AGENT_PID ''
keychain --eval -Q --quiet | source



set -x EMSCRIPTEN "/usr/lib/emscripten"
set -x EMSCRIPTEN_FASTCOMP "/usr/lib/emscripten-fastcomp"

# add to path
set -x PATH $PATH $EMSCRIPTEN

#function fuck
#    eval (thefuck $history[1])
#end

alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias ....... 'cd ../../../../../..'
alias ........ 'cd ../../../../../../..'
alias ......... 'cd ../../../../../../../..'
alias .......... 'cd ../../../../../../../../..'
alias ........... 'cd ../../../../../../../../../..'
alias ............ 'cd ../../../../../../../../../../..'
alias ............. 'cd ../../../../../../../../../../../..'
alias .............. 'cd ../../../../../../../../../../../../..'

set -x PATH $PATH /usr/bin/core_perl/

set -x MOZ_USE_OMTC 1

alias chromium 'chromium --force-device-scale-factor=2'

set -x GDK_SCALE 2
set -x GDK_DPI_SCALE 0.5
setfont sun12x22 2>/dev/null


set -x XKB_DEFAULT_LAYOUT us
set -x XKB_DEFAULT_VARIANT colemak
set -x WLC_REPEAT_DELAY 200
set -x WLC_REPEAT_RATE 40

## start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
#        exec startx -- -keeptty
#    end
#end

alias compose docker-compose

eval sh ~/dotfiles/base16-shell/base16-tomorrow.dark.sh
#echo -n -e '\033]4;16;red\007'

# set background color to transparent again
printf "\033]11;rgba:1110/1110/1110/dddd\007"



#set -x CSCOPE_DB ~/dev/linux/cscope.out
set -x GO15VENDOREXPERIMENT 1

alias vim nvim

# from https://github.com/iamruinous/plugin-powerline with some fixes
function init -a path --on-event init_powerline
  if type -q powerline-daemon
    powerline-daemon -q
  end

  set -q POWERLINE_PACKAGE_DIR; or set -gx POWERLINE_PACKAGE_DIR (pip show powerline-status 2>/dev/null | grep Location | awk '{ print $2 }')
  set fish_function_path $fish_function_path "$POWERLINE_PACKAGE_DIR/powerline/bindings/fish"

  if type -q powerline-setup
    powerline-setup
  else
    echo "Please install powerline"
  end
end
# customize in /home/v/.config/powerline/themes/shell/custom.json
#init

alias tf 'docker run -u (id -u):(id -g) --rm -it -v /home/v/.ssh/id_rsa:/id_rsa -v (pwd):/config -w /config hashicorp/terraform'
alias tf-graph 'tf graph | dot -Tpng | feh -'

alias pack 'docker run -u (id -u):(id -g) --rm -it -v (pwd):/config -w /config hashicorp/packer'
