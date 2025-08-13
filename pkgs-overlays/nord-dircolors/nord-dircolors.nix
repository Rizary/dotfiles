{ stdenv }:
let
  sources = import ../../niv/sources.nix;
in
stdenv.mkDerivation {
  name = "nord-dircolors";
  src = sources.nord-dircolors;
  phases = [ "installPhase" "fixupPhase" ];
  installPhase = ''
    install -m644 -D $src/src/dir_colors $out/etc/dircolors/nord/dir_colors
  '';
}
