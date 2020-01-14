{ ... }:
{
  primary-user.home-manager.home.file.".ssh/known_hosts".source = ./known_hosts;

  primary-user.home-manager.programs.ssh.enable = true;
}
