{ pkgs, lib, ... }:
{
  primary-user.home-manager.programs.direnv.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.direnv ];
}
