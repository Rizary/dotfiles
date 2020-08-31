{ lib, pkgs, ... }:
{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.git ];
  primary-user.home-manager.programs.git.enable = true;
  primary-user.home-manager.programs.git.userName = "rizary";
  primary-user.home-manager.programs.git.userEmail = "andika.riyan@gmail.com";
}
