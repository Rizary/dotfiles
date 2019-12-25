{ pkgs, lib, ... }:
let
  urxvt = pkgs.rxvt_unicode-with-plugins;
in
{
  primary-user.home-manager.default-terminal = "${urxvt}/bin/urxvtc";
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.setterminfo ];
  primary-user.home-manager.programs.urxvt.enable = true;
  primary-user.home-manager.programs.urxvt.package = urxvt;
  primary-user.home-manager.programs.urxvt.scroll.bar.enable = false;
  primary-user.home-manager.programs.urxvt.keybindings = {
    "M-u" = "perl:url-select:select_next";
    "S-Up" = "font-size:increase";
    "S-Down" = "font-size:decrease";
  };
  primary-user.home-manager.programs.urxvt.extraConfig = {
    "perl-ext-common" = "default,clipboard,url-select,keyboard-select,resize-font";
    "url-select.launcher" = "browse";
    "url-select.underline" = true;
  };
}
