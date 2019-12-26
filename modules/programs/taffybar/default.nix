{ pkgs, lib, ... }:

let
  restart-taffybar = ''
    echo "Restarting taffybar..."
    $DRY_RUN_CMD rm -rf $HOME/.cache/taffybar/
    $DRY_RUN_CMD systemctl --user restart taffybar.service && true
    echo "Taffybar restart done"
  '';

in
{
  primary-user.home-manager.services.taffybar.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.taffybar ];
  primary-user.home-manager.home.file.".config/taffybar/taffybar.hs" = {
    source = ./taffybar.hs;
    onChange = restart-taffybar;
  };

  primary-user.home-manager.home.file.".config/taffybar/taffybar.css" = {
    source = ./taffybar.css;
    onChange = restart-taffybar;
  };
}
