{
  description = "NixOS flake for Vusion";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    lib = import ./lib {inherit inputs pkgs;};

    # Global user
    user = {
      name = "vusion";
      homeDir = "/home/vusion";
    };

    # Hosts
    hosts = [
      {
        name = "thinkpad";
        theme = lib.getTheme "catppuccin-mocha";
      }
    ];

    # build each host
    forLinuxHosts = host: {
      name = host.name;
      value = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;

          meta = {
            hostname = host.name;
            theme = host.theme;
          };

          inherit user;
        };

        modules = [
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.${user.name} = import ./hosts/home.nix;
              extraSpecialArgs = {
                inherit inputs;
                meta = host;
                inherit user;
              };
            };
          }

          ./hosts/configuration.nix
        ];
      };
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map forLinuxHosts hosts);
  };
}
