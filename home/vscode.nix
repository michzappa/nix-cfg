{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.vscode = {
    enable = true;
    
    userSettings = {
      "[nix]"."editor.tabSize" = 2;
      "workbench.colorTheme" = "Nord";
    };
    
    # to update vscode packages run 'nixpkgs/pkgs/misc/vscode-extensions/update_installed_exts.sh' 
    # at https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/vscode-extensions/update_installed_exts.sh
    # don't quite know how this works
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix

    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace[
      {
        name = "nord-visual-studio-code";
        publisher = "arcticicestudio";
        version = "0.15.0";
        sha256 = "066rqj8sf910n71g5njbp5g8advzqkd3g2lsg12wai902735i78c";
      }

      {
        name = "nix-env-selector";
        publisher = "arrterian";
        version = "0.1.2";
        sha256 = "1n5ilw1k29km9b0yzfd32m8gvwa2xhh6156d4dys6l8sbfpp2cv9";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.2.0";
        sha256 = "0vxsn4s27n1aqp5pp4cipv804c9cwd7d9677chxl0v18j8bf7zly";
      }

      {
        name = "org-mode";
        publisher = "vscode-org-mode";
        version = "1.0.0";
        sha256 = "1dp6mz1rb8awrrpig1j8y6nyln0186gkmrflfr8hahaqr668il53";
      }
    ];
  };
}
