{ pkgs, ... }:

{
  primary-user.extraGroups = [ "libvirtd" "docker" "vboxusers" "kvm" "networkmanager" ];
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.virtmanager}/bin/virt-manager &
    ${pkgs.spice-vdagent}/bin/spice-vdagent
  '';

  # Docker related config
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  virtualisation.docker.extraOptions = "--dns 172.17.0.1";
  networking.firewall.interfaces.docker0.allowedTCPPorts = [ 53 9053 ];
  networking.firewall.interfaces.docker0.allowedUDPPorts = [ 53 9053 ];

  # Virtual Box related config

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.headless = false;
  networking.firewall.checkReversePath = false;

  # Libvirtd related config
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemuPackage = pkgs.qemu_kvm.overrideDerivation (
    p: {
      patches = p.patches ++ [
        ./nested_svm_disable_blockers.patch
        ./nested_svm_disable_blockers2.patch
      ];
    }
  );
  virtualisation.libvirtd.qemuVerbatimConfig = ''
    namespaces = [];
    # if having virgl gpu issues uncomment
    #seccomp_sandbox = 0
  '';
  virtualisation.libvirtd.qemuOvmf = true;
  virtualisation.libvirtd.qemuRunAsRoot = false;
  virtualisation.libvirtd.onBoot = "ignore";
  virtualisation.libvirtd.onShutdown = "shutdown";
  #services.dnsmasq.extraConfig = ''
  # ignore virbr0 as libvirtd listens here
  #  except-interface=virbr0
  #'';
  security.wrappers.spice-client-glib-usb-acl-helper.source =
    "${pkgs.spice_gtk}/bin/spice-client-glib-usb-acl-helper";

  # QEMU related config
  security.rngd.enable = false;
  services.spice-vdagentd.enable = true;
  services.xserver.videoDrivers = lib.mkOverride 50 [ "qxl" "modesetting" ];

  # Kubernetes related config
  # export KUBECONFIG=/etc/kubernetes/cluster-admin.kubeconfig will make kubectl use this kubeconfig to access and authenticate the cluster
  #
  #
  services.kubernetes.roles = [ "master" "node" ];
  services.kubernetes.package = pkgs.kubernetes;
  services.kubernetes.masterAddress = "localhost";
}
