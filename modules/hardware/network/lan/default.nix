{ ... }:
{
  # DnsMasq cofig
  #services.dnsmasq.enable = true;
  # Networking config
  #networking.nat.externalInterface = "enp0s31f6";
  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [ "enp0s31f6" "virbr0" "docker0" "vboxnet+" ];
  #networking.nat.internalInterfaces = [ "virbr0" ];
  networking.firewall.allowedTCPPorts = [ 80 443 8000 ];
  #networking.nat.enable = true;
  networking.networkmanager.enable = true;
  #networking.networkmanager.insertNameservers = [ "127.0.0.1" ];
  networking.resolvconf.enable = true;
}
