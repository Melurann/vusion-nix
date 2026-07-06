{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # tools
    wireguard-tools
    eza
    alsa-utils
    fzf
    ripgrep
    cloc
    bat
    gh
    jq
    zip
    unzip
    gnupg
    zoxide
    delta
    ffmpeg
    sass
    virtualenv # <https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments>

    # tui
    typioca
    binsider
    pipes-rs
    gpg-tui
    lazygit
    btop
    neovim
    yazi
    zellij
    minicom
    termshark
    pulseaudio
    pulsemixer
  ];
}
