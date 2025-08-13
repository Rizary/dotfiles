{ ... }:
{
  #primary-user.home-manager.home.file.".ssh/known_hosts".text = "${builtins.toString ./known_hosts}";

  primary-user.home-manager.programs.ssh.enable = true;
  #primary-user.home-manager.programs.ssh.hashKnownHosts = true;
  primary-user.home-manager.programs.ssh.matchBlocks = {
    "gitlab.com" = {
      identityFile = "/home/rizary/.ssh/nixos_kvm";
    };

    "github.com" = {
      identityFile = "/home/rizary/.ssh/nixos_kvm";
    };

    "gitlab.haskell.org" = {
      identityFile = "/home/rizary/.ssh/nixos_kvm";
    };
    #inherit (import ../../../../../../secure/ssh/matchblocks.nix { }) "github.com" "gitlab.com" "gitlab.haskell.com";
  };
}
