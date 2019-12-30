{ pkgs, lib, ... }:
let
  urxvt = pkgs.rxvt_unicode-with-plugins;
in
{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.rofi ];

  primary-user.home-manager.programs.rofi.enable = true;
  primary-user.home-manager.programs.rofi.width = 750;
  primary-user.home-manager.programs.rofi.lines = 15;
  primary-user.home-manager.programs.rofi.font = "Fira Mono 14";
  primary-user.home-manager.programs.rofi.scrollbar = false;
  primray-user.home-manager.programs.rofi.terminal = "${urxvt}/bin/urxvtc";
  primary-user.home-manager.programs.rofi.separator = [ "solid" ];
  primary-user.home-manager.programs.rofi.theme = ./nord.rasi;
  primary-user.home-manager.programs.rofi.extraConfig = ''
    show-match: false;
  '';
}
