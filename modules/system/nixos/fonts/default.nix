{ pkgs, ... }:
{
  # Font config
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [
    emacs-all-the-icons-fonts
    paper-icon-theme
    source-code-pro
  ];
  fonts.fontconfig.enable = true;
}
