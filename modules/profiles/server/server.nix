<<<<<<< HEAD
{ config, lib, pkgs, ... }:
=======
{ ... }:
>>>>>>> flakes
with lib;
{
  imports = [ ./hardening.nix ];
  services.nixosManual.enable = false;
  services.openssh.passwordAuthentication = false;
  services.fail2ban.enable = true;

<<<<<<< HEAD
  networking.firewall.allowedTCPPorts = [22];
=======
  networking.firewall.allowedTCPPorts = [ 22 ];
>>>>>>> flakes
}
