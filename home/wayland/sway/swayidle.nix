{
  pkgs,
  config,
  lib,
  ...
}: let
  swaylock = "${lib.getExe config.programs.swaylock.package} -f";
  swaymsg = "${pkgs.sway}/bin/swaymsg";
in {
  services.swayidle = {
    enable = true;
    extraArgs = ["-w"];

    events = [
      {
        event = "before-sleep";
        command = swaylock;
      }
      {
        event = "lock";
        command = swaylock;
      }
    ];

    timeouts = [
      # lock after 5 min idle
      {
        timeout = 300;
        command = swaylock;
      }
      # turn off after 10 min
      {
        timeout = 600;
        command = "${swaymsg} 'output * power off'";
        resumeCommand = "${swaymsg} 'output * power on";
      }
    ];
  };
}
