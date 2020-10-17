{
  description = "Init!";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs-channels";
      ref = "nixos-20.03";
    };

    unstable = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs-channels";
      ref = "nixpkgs-unstable";
    };

    master = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs-channels";
      ref = "nixos-20.03";
    };

    home-manager = {
      type = "github";
      owner = "rycee";
      repo = "home-manager";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, unstable, master, ... }@inputs: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
  };
}
