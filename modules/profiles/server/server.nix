{ config, lib, pkgs, ... }:
with lib;
{
  imports = [ ./hardening.nix ];
  services.nixosManual.enable = false;
  services.openssh.passwordAuthentication = false;
  services.fail2ban.enable = true;

  networking.firewall.allowedTCPPorts = [22];
}
