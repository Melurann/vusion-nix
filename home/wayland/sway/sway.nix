{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    package = null; # using programs.sway
    checkConfig = false;

    config = {
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

      output."*" = {
        bg = "${../../../wallpapers/nixos.png} fill";
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

      keybindings = let
        win = "Mod4";
      in
        lib.mkOptionDefault {
          # Launch Applications
          "${win}+e" = "exec walker --hideqa";
          "${win}+Shift+e" = "exec walker -m runner --hideqa";
          "${win}+Shift+n" = "exec ${pkgs.swaynotificationcenter}/bin/swaync-client -t";
          "${win}+q" = "exec ${lib.getExe pkgs.ghostty}";
          "${win}+b" = "exec ${lib.getExe pkgs.brave}";
          "${win}+d" = "exec ${lib.getExe pkgs.vesktop}";
          "${win}+f" = "exec ${lib.getExe pkgs.nautilus}";
          "${win}+s" = "exec spotify"; # spicetify-Wrapper -> bare
          "${win}+p" = "exec ${lib.getExe pkgs._1password-gui}";

          # Audio
          "${win}+v" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute   @DEFAULT_SINK@ toggle";
          "${win}+u" = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          "${win}+a" = "exec ${lib.getExe pkgs.pavucontrol}";

          "${win}+Shift+b" = "exec ${pkgs.blueman}/bin/blueman-manager";
          "${win}+w" = "exec ${pkgs.networkmanagerapplet}/bin/nm-connection-editor";

          # Lock
          "${win}+Shift+c" = "exec pidof swaylock || swaylock";
          "${win}+c" = "kill";

          # Window Management
          "${win}+m" = "fullscreen toggle";

          # Move Focus
          "${win}+h" = "focus left";
          "${win}+l" = "focus right";
          "${win}+k" = "focus up";
          "${win}+j" = "focus down";
          "${win}+Left" = "focus left";
          "${win}+Right" = "focus right";
          "${win}+Up" = "focus up";
          "${win}+Down" = "focus down";

          # Move Windows
          "${win}+Shift+Left" = "move left";
          "${win}+Shift+Right" = "move right";
          "${win}+Shift+Up" = "move up";
          "${win}+Shift+Down" = "move down";
          "${win}+Shift+h" = "move left";
          "${win}+Shift+l" = "move right";
          "${win}+Shift+k" = "move up";
          "${win}+Shift+j" = "move down";

          # Workspaces
          "${win}+1" = "workspace number 1";
          "${win}+2" = "workspace number 2";
          "${win}+3" = "workspace number 3";
          "${win}+4" = "workspace number 4";
          "${win}+5" = "workspace number 5";
          "${win}+6" = "workspace number 6";
          "${win}+7" = "workspace number 7";
          "${win}+8" = "workspace number 8";
          "${win}+9" = "workspace number 9";
          "${win}+0" = "workspace number 10";

          "${win}+Shift+1" = "move container to workspace number 1";
          "${win}+Shift+2" = "move container to workspace number 2";
          "${win}+Shift+3" = "move container to workspace number 3";
          "${win}+Shift+4" = "move container to workspace number 4";
          "${win}+Shift+5" = "move container to workspace number 5";
          "${win}+Shift+6" = "move container to workspace number 6";
          "${win}+Shift+7" = "move container to workspace number 7";
          "${win}+Shift+8" = "move container to workspace number 8";
          "${win}+Shift+9" = "move container to workspace number 9";
          "${win}+Shift+0" = "move container to workspace number 10";

          "${win}+button5" = "workspace next_on_output"; # scroll down
          "${win}+button4" = "workspace prev_on_output"; # scroll up
        };
    };
  };
}
