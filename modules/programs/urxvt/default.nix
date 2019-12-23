{ pkgs, lib, ... }:
let
  urxvt = pkgs.rxvt_unicode-with-plugins;
in
{
  primary-user.home-manager.default-terminal = "${urxvt}/bin/urxvtc";
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.setterminfo ];
  primary-user.home-manager.programs.uxrvt.enable = true;
  primary-user.home-manager.programs.uxrvt.package = urxvt;
  primary-user.home-manager.programs.uxrvt.scroll.bar.enable = false;
  primary-user.home-manager.programs.uxrvt.keybindings = {
    "M-u" = "perl:url-select:select_next";
    "S-Up" = "font-size:increase";
    "S-Down" = "font-size:decrease";
  };
  primary-user.home-manager.programs.uxrvt.extraConfig = {
    "perl-ext-common" = "default,clipboard,url-select,keyboard-select,resize-font";
    "url-select.launcher" = "browse";
    "url-select.underline" = true;
  };

  # urxvtd daemon
  systemd.user.services.urxvtd.Unit.Description = "rxvt-unicode daemon";
  systemd.user.services.urxvtd.Unit.After = [ "graphical-session-pre.target" ];
  systemd.user.services.urxvtd.Unit.PartOf = [ "graphical-session.target" ];
  systemd.user.services.urxvtd.Install.WantedBy = [ "graphical-session.target" ];
  systemd.user.services.urxvtd.Service.ExecStart = "${urxvt}/bin/urxvtd";
}
