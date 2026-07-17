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
    pulseaudio
    pulsemixer

    # sdr
    hackrf
    gnuradio
    usbutils
  ];
}
