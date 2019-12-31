{ pkgs, lib, ... }:
{
  primary-user.home-manager.programs.autorandr.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.autorandr ];
}
