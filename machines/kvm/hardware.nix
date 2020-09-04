{ pkgs, lib, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];
  boot.kernelParams = [ "video=hyperv_fb:1920x1080 elevator=noop" ];
  boot.kernelModules = [ "kvm-intel" ];
  services.xserver.videoDrivers = [ "hyperv_fb" ];
  services.xserver.modules = [ pkgs.xorg.xf86videofbdev ];
  #services.urxvtd.enable = true;

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/504b6c0c-1cbb-435a-b46e-11d40e908f58";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/AC32-B98D";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/a2270dab-e6b5-40fb-bdfe-cada55d1cceb";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/c336cb25-dbe7-446f-a9f5-8d89d3ffa871"; }];

  nix.maxJobs = lib.mkDefault 8;
  virtualisation.hypervGuest.enable = true;
}
