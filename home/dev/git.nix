_: {
  # <https://nixos.wiki/wiki/Git>
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "melurann";
        email = "fruroa21@htl-kaindorf.at";
      };

      pull = {
        rebase = true;
      };

      credential.helper = "!gh auth git-credential";
    };

    ignores = ["*~" ".DS_Store" ".direnv"];
  };
}
