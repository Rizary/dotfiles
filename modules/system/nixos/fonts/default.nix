{ pkgs, ... }:
{
  # Font config
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [
    emacs-all-the-icons-fonts
<<<<<<< HEAD
    powerline-fonts
    source-code-pro
    nerdfonts
    emojione
    noto-fonts-emoji
  ];
=======
    paper-icon-theme
    source-code-pro
    font-awesome_4
    font-awesome_5
    noto-fonts
    iosevka
    pragmatapro
  ];
  fonts.fontconfig.enable = true;
>>>>>>> flakes
}
