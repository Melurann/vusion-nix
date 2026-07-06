{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # tools
    alsa-utils
    ripgrep
    gh
    zip
    unzip
    delta
    ffmpeg

    # tui
    lazygit
    btop
    neovim
    yazi
    zellij
    pulseaudio
    pulsemixer

    # sdr
    hackrf
    gnuradio
    usbutils
  ];
}
