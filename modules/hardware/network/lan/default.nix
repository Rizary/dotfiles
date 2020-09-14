{ ... }:
{
  # DnsMasq cofig
  #services.dnsmasq.enable = true;
  # Networking config
  #networking.nat.externalInterface = "enp0s31f6";
  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" "docker0" "ens3" "vboxnet+" ];
  #networking.nat.internalInterfaces = [ "virbr0" ];
  networking.firewall.allowedTCPPorts = [ 80 87 443 1111 5432 8000 8080 8081 8383 9000 ];
  #networking.nat.enable = true;
  #networking.networkmanager.enable = true;
  #networking.networkmanager.insertNameservers = [ "127.0.0.1" "8.8.8.8" "8.8.4.4" ];
  networking.resolvconf.enable = true;
  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;

}
