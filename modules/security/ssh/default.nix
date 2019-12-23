{ pkgs, lib, ... }:
let
  ssh-path = lib.makeBinPath [
    pkgs.coreutils
    pkgs.gnused
    pkgs.gnugrep
    pkgs.git
    pkgs.openssh
  ];
in
{
  primary-user.home-manager = {
    home.file = {
      ".ssh/known_hosts".sourc = ./know_hosts;
      ".ssh/authorized_keys".source = ./authorized_keys;
      ".ssh/environment".text = "Path=${ssh-path}";
    };

    program.ssh.enable = true;
  };
}
