{ pkgs, lib, ... }:
{
  primary-user.home-manager = {
    home.packages = lib.mkForce [ pkgs.gnupg ];
    services.gpg-agent.enable = true;
    services.gpg-agent.enableSshSupport = true;
  };
}
