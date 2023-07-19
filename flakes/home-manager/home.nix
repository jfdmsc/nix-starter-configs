{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allUnfreePredicate = (_: true);
    };
   };
  home = {
    username = "jfabio";
    homeDirectory = "/home/jfabio";
    };
  home.packages = with pkgs; [
  htop
  ];


  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
