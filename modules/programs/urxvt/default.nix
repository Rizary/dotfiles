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

  primary-user.home-manager.programs.urxvt.extraConfig = {
    "perl-ext-common" = "default,clipboard,url-select,keyboard-select,resize-font";
    "copyCommand" = "xclip -i -selection clipboard";
    "pasteCommand" = "xclip -o -selection clipboard";
    "url-select.launcher" = "browse";
    "url-select.underline" = "true";
    "urlLauncher" = "firefox";
    "underlineURLs" = "true";
    "urlButton" = "1";

    # Appearance

    "font" = "xft:Iosevka:style=Regular:size=14";
    "boldFont" = "xft:Iosevka:style=Bold;size=14";
    "italicFont" = "xft:Iosevka:style=Italic:size=14";
    "boldItalicFont" = "xft:Iosevka:style=Bold Italic:size=14";
    "letterSpace" = "0";
    "lineSpace" = "0";
    "geometry" = "92x24";
    "internalBorder" = "24";
    "cursorBlink" = "true";
    "cursorUnderline" = "true";
    "saveline" = "2048";
    "scrollBar" = "false";
    "scrollBar_right" = "false";
    "urgentOnBell" = "true";
    "depth" = "24";
    "iso14755" = "false";

    # Color Scheme

    "background" = " #012641";
    "foreground" = "FFFFFF";
    "cursorColor" = "FEBF49";
    "color0" = "#248AB48";
    "color1" = "#3EB6B6";
    "color2" = "#9264E9";
    "color3" = "#FFFFFF";
    "color4" = "#FEBF49";
    "color5" = "#005EFF";
    "color6" = "#7C587F";
    "color7" = "#743F31";
    "color8" = "#FFFFFF";
    "color9" = "#B25252";
    "color10" = "#DC0A99";
    "color11" = "#93CCFF";
    "color12" = "#AD933D";
    "color13" = "#B25252";
    "color14" = "#DC0A99";
    "color15" = "#FBFCFD";
  };

}
