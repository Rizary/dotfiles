{ host }:

let
  dirPath = ./.;
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  excludeGit = builtins.filterSource (
    path: type:
      type != "directory" || baseNameOf path != ".git"
  );

in
  pkgs.stdenv.mkDerivation {
    name = "dotfiles";
    src = excludeGit dirPath;
    phases = [ "unpackPhase" "installPhase" ];
    unpackPhase = ''
      cp -r $src $out
    '';
    installPhase = ''
      chmod +w -R $out
      ln -s $out/machines/${host} $out/current-config
      ls $out
    '';
  }

