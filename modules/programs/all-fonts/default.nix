{ pkgs, lib, ... }:
{
  primary-user.home-manager.home.packages = lib.mkForce [
    #    pragmataPro
    pkgs.font-awesome_4
    pkgs.font-awesome_5

  ];
}
