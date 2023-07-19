{
  description = "Initial barbones flake, with home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = {self, nixpkgs, home-manager }: {
    nixosConfigurations = {
    avell-nixos = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     modules = [
     ./nixos/configuration.nix
     home-manager.nixosModules.home-manager {
       home-manager.useGlobalPkgs = true;
       home-manager.useUserPackages = true;
       home-manager.users.jfabio = import ./home-manager/home.nix;
     }
     ];
    };
  };
 };
}
