{ ... }:
{
  # Networking config
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 8000 ];
}
