{ ... }:

{
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.headless = false;
  networking.firewall.checkReversePath = false;
  primary-user.extraGroups = [ "libvirtd" "docker" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemuOvmf = true;
  virtualisation.libvirtd.qemuRunAsRoot = false;
  virtualisation.libvirtd.onBoot = "ignore";
  virtualisation.libvirtd.onShutdown = "shutdown";
}
