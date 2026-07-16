{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    package = null; # using programs.sway
    checkConfig = false;

    config = rec {
      modifier = "Mod4";
      terminal = "foot";
      menu = "wofi --show drun";

      input = {
        "type:keyboard" = {
          xkb_layout = "de";
        };
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          dwt = "enabled"; # dwt -> disable while typing
          middle_emulation = "enabled";
        };
      };

      gaps = {
        inner = 6;
        outer = 2;
        smartGaps = true;
      };
      window = {
        border = 2;

        titlebar = false;
      };
      floating = {
        border = 2;
        titlebar = false;
      };

      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
        }
      ];

      keybindings = lib.mkOptionDefault {
        # Launch Applications
        "${modifier}+e" = "exec walker --hideqa";
        "${modifier}+Shift+e" = "exec walker -m runner --hideqa";
        "${modifier}+Shift+n" = "exec ${pkgs.swaynotificationcenter}/bin/swaync-client -t";
        "${modifier}+q" = "exec ${lib.getExe pkgs.ghostty}";
        "${modifier}+b" = "exec ${lib.getExe pkgs.brave}";
        "${modifier}+d" = "exec ${lib.getExe pkgs.vesktop}";
        "${modifier}+f" = "exec ${lib.getExe pkgs.nautilus}";
        "${modifier}+s" = "exec spotify"; # spicetify-Wrapper -> bare
        "${modifier}+p" = "exec ${lib.getExe pkgs._1password-gui}";

        # Audio
        "${modifier}+v" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute   @DEFAULT_SINK@ toggle";
        "${modifier}+u" = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "${modifier}+a" = "exec ${lib.getExe pkgs.pavucontrol}";

        "${modifier}+Shift+b" = "exec ${pkgs.blueman}/bin/blueman-manager";
        "${modifier}+w" = "exec ${pkgs.networkmanagerapplet}/bin/nm-connection-editor";

        # Lock
        "${modifier}+Shift+c" = "exec pidof swaylock || swaylock";
        "${modifier}+c" = "kill";

        # Window Management
        "${modifier}+m" = "fullscreen toggle";
        "${modifier}+Shift+m" = "fullscreen toggle global";
        # "$mainMod, SHIFT P, pseudo" -> hat sway nicht, siehe Notiz unten

        # Move Focus
        "${modifier}+h" = "focus left";
        "${modifier}+l" = "focus right";
        "${modifier}+k" = "focus up";
        "${modifier}+j" = "focus down";
        "${modifier}+Left" = "focus left";
        "${modifier}+Right" = "focus right";
        "${modifier}+Up" = "focus up";
        "${modifier}+Down" = "focus down";

        # Move Windows
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+l" = "move right";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+j" = "move down";

        # Workspaces
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        # Workspace-Wechsel per Mausrad
        "${modifier}+button5" = "workspace next_on_output"; # scroll down
        "${modifier}+button4" = "workspace prev_on_output"; # scroll up
      };
    };
  };
}
