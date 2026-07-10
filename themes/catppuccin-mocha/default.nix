{pkgs, ...}: {
  name = "catppuccin-mocha";
  scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  polarity = "dark";

  fonts = {
    monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font Mono";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };

    serif = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };

    emoji = {
      package = pkgs.nerd-fonts.symbols-only;
      name = "Symbols Nerd Font";
    };
  };
}
