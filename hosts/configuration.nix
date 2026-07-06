{
  pkgs,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../nixos
    ../modules
  ];

  users.users.${user.name} = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "docker" "networkmanager"];

    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # home-manager enables the shell

    initialPassword = "vusion";
  };

  system.stateVersion = "25.05";
}
