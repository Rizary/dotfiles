{ pkgs, lib, ... }:
{
  primary-user.home-manager.home.packages = lib.mkForce [
    #pkgs.nerdfonts
    pkgs.font-awesome_5
    pkgs.noto-fonts
    pkgs.iosevka
  ];
  #primary-user.home-manager.fonts.fontconfig.enable = true;
}
