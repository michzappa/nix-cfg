{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = ./rofi/grayscale.rasi;
  }; 
}
