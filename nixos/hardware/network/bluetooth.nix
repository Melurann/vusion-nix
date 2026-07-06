# <https://wiki.nixos.org/wiki/Bluetooth>
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [bluez bluez-tools];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    hsphfpd.enable = false;
    package = pkgs.bluez;

    settings.Policy.AutoEnable = "true";
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      ControllerMode = "dual";
      FastConnectable = "true";
      Experimental = "true";
      KernelExperimental = "true";
    };
  };
}
