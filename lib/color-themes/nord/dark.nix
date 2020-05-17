{ callPackage, nord-dircolors }:
let
  colors = callPackage ./colors.nix { };
  common = callPackage ./common.nix { };
in
common // {
  background = colors.darkbg;
  foreground = colors.darkfg;
  highlightBackground = colors.nord3;
  highlightForeground = colors.nord6;
  secondaryContent = colors.nord1;
  selection = colors.nord2;

  dircolors = "${nord-dircolors}/etc/dircolors/nord/dir_colors";

}
