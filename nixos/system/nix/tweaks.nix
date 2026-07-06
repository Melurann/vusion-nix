_: {
  # <https://nixos.org/manual/nixpkgs/unstable/#chap-packageconfig>
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
    allowUnsupportedSystem = false;
    # allowlistedLicenses = with lib.licenses; [ amd ];
    # blocklistedLicenses = with lib.licenses; [ wtfpl ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
