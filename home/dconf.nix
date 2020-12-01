# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 600;
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
    };

    "org/gnome/desktop/input-sources" = {
      current = "uint32 0";
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "us+alt-intl" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      gtk-im-module = "gtk-im-context-simple";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-network-panel" "gnome-power-panel" ];
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      report-technical-problems = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      maximized = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-last-coordinates = mkTuple [ 42.294001 "-71.1081" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" ];
      home = [ "<Super>n" ];
      search = [ "<Super>slash" ];
      www = [ "<Super>x" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "gnome-terminal";
      name = "Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>m";
      command = "emacs";
      name = "Emacs";
    };

    "org/gnome/shell" = {
      favorite-apps = [ "firefox.desktop" "org.gnome.Terminal.desktop" "emacs.desktop" "idea-ultimate.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = "@as []";
      toggle-message-tray = [ "<Super>v" ];
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      show-hidden = true;
    };

  };
}
