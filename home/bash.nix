{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable  = true;
    interactiveShellInit = ''
    export PATH=~/.emacs.d/bin:$PATH
    '';
    promptInit = "PS1='[\u@\h \W]\$ ";
    enableCompletion = true;
    enableLsColors = true;
  };
}
