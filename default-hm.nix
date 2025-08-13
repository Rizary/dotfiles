{ sources ? import ./niv/sources.nix }:
let
  pkgs = import sources.nixpkgs { };
  niv = pkgs.symlinkJoin {
    name = "niv";
    paths = [ sources.niv ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/niv \
        --add-flags "--sources-file ${toString ./niv/sources.json}"
    '';
  };

  home-manager = pkgs.callPackage "${sources.home-manager}/home-manager" { path = sources.home-manager; };
  install-home-manager = pkgs.callPackage "${sources.home-manager}/home-manager/install.nix" { inherit home-manager; };
  nix-linter = pkgs.callPackage sources.nix-linter { };
  build-nix-path-env = path:
    builtins.concatStringsSep ":" (
      pkgs.lib.mapAttrsToList (k: v: "${k}=${v}") path
    );
  nix-path = build-nix-path-env {
    nixpkgs = sources.nixpkgs;
    nixpkgs-overlays = "$dotfiles/pkgs-overlays";
    nixos-config = "$dotfiles/current-config";
    home-manager = sources.home-manager;
  };
  files = "$(find . -name '*.nix' -not -wholename './niv/sources.nix')";
  #lint = pkgs.writeShellScriptBin "lint" "nix-linter ${files}";
  format = pkgs.writeShellScriptBin "format" "nixpkgs-fmt ${files}";

  deploy-config-cmd = pkgs.writeShellScript "deploy-config-cmd" ''
    export dotfiles="$(nix-build --argstr host $1 --no-out-link)"
    export NIX_PATH="${nix-path}"
    nixos-rebuild switch --show-trace
  '';

  install-hm = pkgs.writeShellScript "install-hm" ''
    export dotfiles="$(nix-build --argstr host kvm --no-out-link)"
    export NIX_PATH="${nix-path}"
    nix-shell -A install-home-manager
  '';

  deploy-hm = pkgs.writeShellScriptBin "deploy-hm" ''
    install-hm
  '';

  deploy-config = pkgs.writeShellScriptBin "deploy-config" ''
    set -e
    # lint
    format

    if ! $(mount | grep /boot >/dev/null)
    then
      echo "/boot is not mounted!"
      exit 1
    fi

    if ! $(mount | grep /secure >/dev/null)
    then
      echo "/secure is not mounted"
      exit 1
    fi

    sudo ${deploy-config-cmd} $1 
  '';

  deploy-config-non-secure =
    pkgs.writeShellScriptBin "deploy-config-non-secure" ''
      set -e
      # lint
      format

      if ! $(mount | grep /boot >/dev/null)
      then
        echo "/boot is not mounted!"
        exit 1
      fi

      sudo ${deploy-config-cmd} $1 
    '';

  collect-garbage =
    pkgs.writeShellScriptBin "collect-garbage" "sudo nix-collect-garbage -d";
  update-niv =
    pkgs.writeShellScriptBin "nix-prefetch" ''
      nix-prefetch-git https://github.com/nmattia/niv /ref/heads/master \
        --fetch-submodules --deepClone > niv/github.json
    '';
in with pkgs; rec {
 
} 

