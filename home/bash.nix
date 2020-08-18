{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable  = true;
    bashrcExtra = ''
    export PATH=~/.emacs.d/bin:$PATH
    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
    PS1='[\u@\h \W\]]$(parse_git_branch)\$ ' 
    '';
  };
}
