{ sources ? import ./niv/sources.nix }:
let
  pkgs = import sources.nixpkgs {};
  niv = pkgs.symlinkJoin {
    name = "niv";
    paths = [ sources.niv ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/niv \
        --add-flags "--sources-file ${toString ./niv/sources.json}"
    '';
  };
  nix-linter = pkgs.callPackage sources.nix-linter {};
  build-nix-path-env = path:
    builtins.concatStringSep ":" (
      pkgs.lib.mapAttrsToList (k: v: "${k}=${v}") path
    );
  nix-path = build-nix-path-env {
    nixpkgs = sources.nixpkgs;
    nixpkgs-overlays = "$dotfiles/pkgs-overlays";
    nixos-config = "$dotfiles/current-config";
    home-manager = sources.home-manager;
  };
  files = "$(find . -name '*.nix' -not -wholename './niv/sources.nix')";
  lint = pkgs.writeShellScriptBin "lint" "nix-linter ${files}";
  format = pkgs.writeShellScriptBin "format" "nixpkgs-fmt ${files}";
  deploy-config-cmd = pkgs.writeShellScript "deploy-config-cmd" ''
    export dotfiles="$(nix-build --argstr host $1 --no-out-link)"
    export NIX_PATH="${nix-path}"
    nixos-rebuild switch --show-trace
  '';
  deploy-config = pkgs.writeShellScritBin "deploy-config" ''
    set -e
    lint
    format

    if ! $(mount | grep /boot >/dev/null)
    then
      echo "/boot is not mounted!
      exit 1
    fi

    if ! $(mount | grep /secure >/dev/null)
    then
      echo "/secure is not mounted
      exit 1
    fi

    sudo ${deploy-config-cmd}
  '';
  collect-garbage =
    pkgs.writeShellScriptBin "collect-garbage" "sudo nix-collect-garbage -d";
  update-niv =
    pkgs.writeShellScriptBin "nix-prefetch" ''
      nix-prefetch-git https://github.com/nmattia/niv /ref/heads/master \
        --fetch-submodules --deepClone > niv/github.json
    '';

in
  with pkgs;
  mkShell {
    nativeBuildInputs = [
      git
      collect-garbage
      nix-prefetch-git
      nix-prefetch-url
      cabal2nix
      nixpkgs-fmt
      nix-linter.nix-linter
    ];

    buildInputs = [
      ghc
      hakyll
      cabal-install
      ghcid
      ghcide
      niv
      nix-linter.nix-linter
      lint
      format
      deploy
    ];

    LC_ALL = "en_US.UTF-8";
    shellHook = ''
      export NIX_GHC="${haskellPackages.ghc}/bin/ghc"
      export NIX_GHCPKG="${haskellPackages.ghc}/bin/ghc-pkg"
      export NIX_GHC_DOCDIR="${haskellPackages.ghc}/share/doc/ghc/html"
      export NIX_GHC_LIBDIR=$( $NIX_GHC --print-libdir )
    '';
  }

