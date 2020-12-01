{ config, lib, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set tabstop=4
      set number
      set autoindent
      set mouse=a
      set paste
      syntax on
    '';
  };
}
