{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cmake
    pkg-config
    tree-sitter
    uv # https://docs.astral.sh/uv/
    alejandra

    nil
    nixd
    rust-analyzer
    rustup
    bash-language-server
    lua-language-server
    pyright
    clang-tools
    lldb
    stylua
  ];
}
