{ config, lib, pkgs, ... }:

{
  programs.git ={ 
    enable = true;
    userName = "michzappa";
    userEmail = "zapprich@gmail.com";
    extraConfig = {
      credential = { helper = "store"; };
      pull = { rebase = false; };
    };
  };
}
