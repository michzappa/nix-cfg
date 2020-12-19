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

    "org/gnome/Music" = {
      window-maximized = true;
      window-position = [ 0 0 ];
      window-size = [ 1920 1006 ];
    };

    "org/gnome/Totem" = {
      active-plugins = [ "movie-properties" "save-file" "vimeo" "apple-trailers" "rotation" "recent" "autoload-subtitles" "media-player-keys" "open-directory" "variable-rate" "skipto" "screensaver" "screenshot" ];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
    };

    "org/gnome/desktop/input-sources" = {
      current = "uint32 0";
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "HighContrastInverse";
      show-battery-percentage = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-network-panel" "gnome-power-panel" "firefox" ];
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      report-technical-problems = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
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
      night-light-enabled = true;
      night-light-last-coordinates = mkTuple [ 44.88350143988481 "-93.3719" ];
      night-light-schedule-automatic = false;
      night-light-temperature = "uint32 2261";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" ];
      screensaver = [ "@as []" ];
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

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>n";
      command = "nautilus";
      name = "Nautilus";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>c";
      command = "code";
      name = "VSCode";
    };

    "org/gnome/settings-daemon/plugins/xsettings" = {
      antialiasing = "grayscale";
      hinting = "slight";
    };

    "org/gnome/shell" = {
      app-picker-view = "uint32 1";
      enabled-extensions = [ "apps-menu@gnome-shell-extensions.gcampax.github.com" ];
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

    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      audible-bell = false;
      background-color = "rgb(46,52,54)";
      custom-command = "fish";
      foreground-color = "rgb(211,215,207)";
      login-shell = false;
      palette = [ "rgb(46,52,54)" "rgb(204,0,0)" "rgb(78,154,6)" "rgb(196,160,0)" "rgb(52,101,164)" "rgb(117,80,123)" "rgb(6,152,154)" "rgb(211,215,207)" "rgb(85,87,83)" "rgb(239,41,41)" "rgb(138,226,52)" "rgb(252,233,79)" "rgb(114,159,207)" "rgb(173,127,168)" "rgb(52,226,226)" "rgb(238,238,236)" ];
      use-custom-command = true;
      use-theme-colors = false;
      visible-name = "michael";
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 158;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 345 79 ];
      window-size = mkTuple [ 1231 902 ];
    };

  };
}
