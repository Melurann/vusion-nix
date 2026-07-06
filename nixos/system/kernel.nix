{pkgs, ...}: {
  boot = {
    # https://wiki.nixos.org/wiki/Linux_kernel#List_available_kernels
    # By default, the latest LTS linux kernel is installed
    # kernelPackages = pkgs.linuxPackages_latest;

    blacklistedKernelModules = [
    ];

    kernelParams = [
      "quiet" # Reduces boot output messages for a cleaner boot screen
      "logo.nologo" # Disables the display of the kernel logo during boot
      "systemd.unified_cgroup_hierarchy=1" # required for docker
      # "splash" # Enables a splash screen during boot
    ];
  };
}
