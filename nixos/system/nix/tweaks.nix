_: {
  # <https://nixos.org/manual/nixpkgs/unstable/#chap-packageconfig>
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
    allowUnsupportedSystem = false;
    # allowlistedLicenses = with lib.licenses; [ amd ];
    # blocklistedLicenses = with lib.licenses; [ wtfpl ];
  };

  nix.settings = {
    extra-substituters = ["https://walker.cachix.org"];
    extra-trusted-public-keys = [
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
    ];

    experimental-features = ["nix-command" "flakes"];
  };
}
