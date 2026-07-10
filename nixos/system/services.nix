_: {
  services = {
    # <https://nixos.wiki/wiki/Logind>
    logind.settings.Login = {
      # don’t shutdown when power button is short-pressed
      # hard reset is handeled by BIOS/EFI and thus still possible
      HandlePowerKey = "ignore";
      HandlePowerKeyLongPress = "poweroff";
    };

    xserver.xkb.layout = "de";

    kmscon = {
      enable = true;
      hwRender = true;
      useXkbConfig = true;
    };
  };
}
