{ pkgs, lib, ... }:
{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.lxqt.pavucontrol-qt ];
}
