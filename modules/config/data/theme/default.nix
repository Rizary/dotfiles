{ pkgs, lib, config, ... }:
{
  colorTheme.name = "nord/dark";
  primary-user.home-manager.home.packages = lib.mkForce [
    config.primary-user.home-manager.iconTheme.package
    config.primary-user.home-manager.font.package
  ];

  primary-user.home-manager.colorTheme.name = config.colorTheme.name;

  #primary-user.home-manager.iconTheme.package = pkgs.papirus-icon-theme;
  #primary-user.home-manager.iconTheme.name = "Papirus Icon";

  primary-user.home-manager.iconTheme.package = pkgs.paper-icon-theme;
  primary-user.home-manager.iconTheme.name = "Paper Icon";

  primary-user.home-manager.font.package = pkgs.pragmatapro;
  primary-user.home-manager.font.face = "PragmataPro Mono Liga";
  primary-user.home-manager.font.size = 14;
}
