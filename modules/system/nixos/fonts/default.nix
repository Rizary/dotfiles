{ pkgs, ... }:
let
  pragmatapro = pkgs.callPackage ./pragmatapro.nix {};
in
{
  # Font config
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [
    emacs-all-the-icons-fonts
    paper-icon-theme
    source-code-pro
    font-awesome_4
    font-awesome_5
    noto-fonts
    iosevka
    pragmatapro
  ];
  fonts.fontconfig.enable = true;
}
