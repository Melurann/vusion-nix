{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.swaylock = {
    package = pkgs.swaylock-effects;
    enable = true;

    settings = {
      image = "${../../../wallpapers/nixos.png}";
      scaling = "fill";
      effect-blur = "10x7";

      indicator = true;
      indicator-cpas-lock = true;
      indicator-radius = 100;
      indicator-thickness = 10;

      ring-color = lib.mkForce config.lib.stylix.colors.base0D;

      clock = true;
      timestr = "%H:%M";
      datestr = "Hello ${config.home.username}";

      ignore-empty-password = true;
      show-failed-attemps = true;
    };
  };
}
