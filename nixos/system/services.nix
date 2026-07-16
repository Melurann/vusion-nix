{pkgs, ...}: {
  services = {
    greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd sway";
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
  };
}
