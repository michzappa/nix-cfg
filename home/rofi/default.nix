{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.gnome3.gnome-terminal}/bin/gnome-terminal";
    theme = ./grayscale.rasi;
  };
}
