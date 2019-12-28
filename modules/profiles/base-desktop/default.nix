{ ... }:
{
  imports = [
    <home-manager/nixos>
    ../../system

    ../../config/data/session-vars

    ../../config/nix/nix-path
    ../../config/nix/nixpkgs
    ../../config/nix/plugins

    ../../tmp

    ../../security/sudo
    ../../security/umask

    ../../programs/bash
    ../../programs/direnv
    ../../programs/dvp
    ../../programs/lorri
    ../../programs/fish
    ../../programs/status-notifier-watcher

  ];
}
