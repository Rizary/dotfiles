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

  # urxvtd daemon
  #primary-user.home-manager.services.urxvtd.enable = true;

  systemd.user.services.urxvtd.description = "rxvt terminal daemon";
  systemd.user.services.urxvtd.partOf = [ "graphical-session.target" ];
  systemd.user.services.urxvtd.wantedBy = [ "graphical-session.target" ];
  systemd.user.services.urxvtd.serviceConfig.ExecStart = "${urxvt}/bin/urxvtd";
}
