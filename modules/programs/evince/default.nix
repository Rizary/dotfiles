{ pkgs, lib, ... }:
{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.evince ];
  services.dbus.packages = [ pkgs.evince ];
  systemd.packages = [ pkgs.evince ];
}
