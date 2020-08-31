{ pkgs, lib, ... }:
let
  boot = {
    device = "/dev/disk/by-uuid/C9C3-E043";
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
      device = "/dev/disk/by-uuid/2c3f750c-a817-4360-bb35-50caa1abf64d";
      fsType = "ext4";
    };

    "/boot" = boot // {
      options = [ "defaults" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/97ca2ea6-144d-4b62-91bf-7832e41ac4f7";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/8ee9e0dd-372a-480c-bcc0-9671c8634dc5";
    }
  ];

  nix.maxJobs = lib.mkDefault 8;
  virtualisation.hypervGuest.enable = true;
}
