{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cmake
    pkg-config
    uv # https://docs.astral.sh/uv/
    alejandra

    nil
    nixd
    bash-language-server
    lua-language-server
    pyright
    clang-tools
    lldb
    stylua
  ];
}
