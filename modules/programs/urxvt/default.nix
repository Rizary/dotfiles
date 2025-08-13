{ pkgs, lib, ... }:
let
  urxvt = pkgs.rxvt_unicode-with-plugins;
in
{
  primary-user.home-manager.default-terminal = "${urxvt}/bin/urxvtc";
  primary-user.home-manager.home.packages = lib.mkForce [ urxvt pkgs.setterminfo ];
  primary-user.home-manager.programs.urxvt.enable = true;
  primary-user.home-manager.programs.urxvt.package = urxvt;
  primary-user.home-manager.programs.urxvt.scroll.bar.enable = false;
  primary-user.home-manager.programs.urxvt.keybindings = {

    "M-u" = "perl:url-select:select_next";
    "M-c" = "perl:clipboard:copy";
    "M-v" = "perl:clipboard:paste";
    "M-Escape" = "perl:keyboard-select:activate";
    "M-s" = "perl:keyboard-select:search";
    "M-C-v" = "perl:clipboard:paste_escaped";
    "S-Plus" = "font-size:increase";
    "S-Minus" = "font-size:decrease";
    "S-Up" = "command:\033]720;1\077";
    "S-Down" = "command:\033]721;1\077";
    "C-Up" = "command:\033[1;5A";
    "C-Down" = "\033[1;5B";
    "C-Right" = "\033[1;5C";
    "C-Left" = "\033[1;5D";



  };

  primary-user.home-manager.systemd.user.services.urxvtd = {
    Unit = {
      Description = "urxvt daemon";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${urxvt}/bin/urxvtd -q -o";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };

  primary-user.home-manager.programs.urxvt.extraConfig =
    {
      "clipboard.autocopy " = "true";
      "perl-ext-common" = "default,clipboard,url-select,keyboard-select,resize-font";
      "copyCommand" = "xclip -i -selection clipboard";
      "pasteCommand" = "xclip -o -selection clipboard";
      "url-select.launcher" = "browse";
      "url-select.underline" = "true";
      "urlLauncher" = "firefox";
      "underlineURLs" = "true";
      "urlButton" = "1";

      # Appearance

      "font" = "xft:PragmataPro Mono Liga:style=Regular:size=14";
      "boldFont" = "xft:PragmataPro Mono Liga:style=Bold;size=14";
      "italicFont" = "xft:PragmataPro Mono Liga:style=Italic:size=14";
      "boldItalicFont" = "xft:PragmataPro Mono Liga:style=Bold Italic:size=14";
      "letterSpace" = "0";
      "lineSpace" = "0";
      "geometry" = "92x24";
      "internalBorder" = "24";
      "cursorBlink" = "false";
      "cursorUnderline" = "false";
      "saveline" = "2048";
      "scrollBar" = "false";
      "scrollBar_right" = "false";
      "urgentOnBell" = "true";
      "depth" = "24";
      "iso14755" = "false";

    };

}
