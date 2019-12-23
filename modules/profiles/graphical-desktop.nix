{ pkgs, ... }:
{

  boot.kernelPackages = pkgs.linuxPackages_latest;
  ## desktop, window and display manager
  services.xserver.desktopManager.default = "none";
  services.xserver.windowManager.default = "xsession";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "rizary";

  # MongoDBssh configuration
  services.mongodb = { enable = true; };

  # nfs configuration
  services.nfs.server.enable = true;
  services.nfs.server.export = ''
    /home/rizilab           192.168.1.0/24(insecure,rw,sync,no_subtree_check,crossmnt,fsid=0)
    /home/rizilab/nixosNFS  192.168.1.0/24(insecure,rw,sync,no_subtree_check)
  '';
  fileSystems."/home/rizilab/nixosNFS" = {
    device = "/mnt/nixosNFS";
    options = [ "bind" ];
  };

  environment.systemPackages = with pkgs; [
    ascii
    cabal2nix
    node2nix
    python2nix
    git-prefetch-github
    curl
    gnumake
    cmake
    chromium
    file
    fliezilla
    openssl
    gparted
    lsof
    libreoffice
    manpages
    parted
    sudo
    traceroute
    tcpdump
    screen
    remake
    qemu
    tree
    vim
    wireshark
    wget
    w3m
    wgetpaste
    which
    unzip
    zip
    zlib
    nmap
    ncdu
    iptables
    gcc6
    bind
    binutils
    emacs-all-the-icons-fonts
  ];

}
