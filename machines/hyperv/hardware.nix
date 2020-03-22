{ pkgs, lib, ... }:
let
  boot = {
    device = "/dev/disk/by-uuid/2994-5D76";
    fsType = "vfat";
  };
in
{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [ "sd_mod" "sr_mod" ];
  boot.kernelParams = [ "video=hyperv_fb:1920x1080 elevator=noop" ];
  services.xserver.videoDrivers = [ "hyperv_fb" ];
  services.xserver.modules = [ pkgs.xorg.xf86videofbdev ];
  services.urxvtd.enable = true;
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/5dd9c0c1-5175-4404-8f87-a1ce6e05148b";
      fsType = "ext4";
    };

    "/boot" = boot // {
      options = [ "defaults" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/92ea668b-f00e-4f1b-9cd5-155da8822049";
      fsType = "ext4";
    };

    "/var" = {
      device = "/dev/disk/by-uuid/4993a25d-1762-462c-95a5-5d13fc8de524";
      fsType = "ext4";
    };

    "/secure" = {
      device = "/dev/disk/by-uuid/62d00748-312e-407e-876b-e35b699f9b7f";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/654a717a-6233-4597-a179-8552a14c6ce1";
    }
  ];

  nix.maxJobs = lib.mkDefault 8;
  virtualisation.  hypervGuest.enable = true;
}
