{
  pkgs,
  config,
  ...
}: let
  kmsconConfigDir = pkgs.writeTextDir "kmscon.conf" config.services.kmscon.extraConfig;
  kmsconSession = pkgs.writeShellScript "kmscon-session" ''
    exec ${pkgs.kmscon}/bin/kmscon \
    --configdir ${kmsconConfigDir} \
    --vt=1 --seats=seat0 --no-switchvt \
    --login -- ${pkgs.shadow}/bin/login -p -f "''${SUDO_USER:-$USER}"
  '';
in {
  _module.args.kmsconSession = kmsconSession;

  services = {
    greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd 'sudo ${kmsconSession}'";
          user = "greeter";
        };
      };
    };

    # <https://nixos.wiki/wiki/Logind>
    logind.settings.Login = {
      # don’t shutdown when power button is short-pressed
      # hard reset is handeled by BIOS/EFI and thus still possible
      HandlePowerKey = "ignore";
      HandlePowerKeyLongPress = "poweroff";
    };

    xserver.xkb.layout = "de";
  };
}
