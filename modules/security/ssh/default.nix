{ ... }:
{
  primary-user.home-manager.home.file.".ssh/known_hosts".source = ./known_hosts;

  primary-user.home-manager.programs.ssh.enable = true;
  primary-user.home-manager.programs.ssh.hashKnownHosts = true;
  primary-user.home-manager.programs.ssh.matchBlocks = {
    inherit (import ../../../../../../secure/ssh/matchblocks.nix {}) github gitlab gitlab-haskell;
  };
}
