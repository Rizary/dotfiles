{ ... }:
{
  imports = [
    <home-manager/nixos>
    ../../system

    ../../config/data/session-vars

    ../../config/nix/base
    ../../config/nix/nix-path
    ../../config/nix/nixpkgs
    ../../config/nix/plugins

    ../../tmp

    ../../security/sudo
    ../../security/umask

    ../../programs/bash
    ../../programs/git
    ../../programs/direnv
    ../../programs/dvorak
    ../../programs/syncthing
    ../../programs/flameshot
    ../../programs/lorri
    ../../programs/status-notifier-watcher
    #../../programs/emacs
    ../../programs/pavucontrol
  ];
}
