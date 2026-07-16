{inputs, ...}: {
  imports = [inputs.walker.homeManagerModules.default];

  programs = {
    walker = {
      enable = true;
      runAsService = true;

      config = {
        force_keyboard_focus = true;
        placeholders."default" = {
          input = "Search";
          list = "Example";
        };
      };

      # https://github.com/abenz1267/walker?tab=readme-ov-file#features
      # providers.prefixes = [];
    };

    elephant = {
      enable = true;

      providers = [
        "bluetooth"
        "bookmars"
        "calc"
        "clipboard"
        "desktopapplications"
        "files"
        "menus"
        "providerlist"
        "runner"
        "snippets"
        "symbols"
        "todo"
        "unicode"
        "websearch"
        "windows"
        "1password"
      ];
    };
  };
}
