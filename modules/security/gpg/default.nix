{ pkgs, lib, ... }:
{
  primary-user.home-manager = {
    home.packages = lib.mkForce [ pkgs.gnupg ];
    programs.gpg.enable = true;
    services.gpg-agent.enable = true;
    services.gpg-agent.enableSshSupport = true;
    services.gpg-agent.extraConfig = ''
      allow-emacs-pinentry
      allow-loopback-pinentry
    '';
  };
}
