{ pkgs, lib, ... }:

let
  boot = {
    device = "/dev/disk/by-uuid/9856-93FE";
    fsType = "fat32";
  };
in

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [
    "amd_iommu=on"
    "ivrs_ioapic[32]=00:14.0"
    "pcie_aspm=off"
    "iommu=soft"
  ];
  boot.extraModulePackages = [];


  boot.crypt-initrd.enable = true;
  boot.crypt-initrd.device = "/dev/nvme0n1";
  boot.crypt-initrd.key.device = boot;
  boot.crypt-initrd.key.keyPath = "/spitfire";
  boot.crypt-initrd.key.headerPath = "/header.img";

  boot.initrd.availableKernelModules = [ "amdgpu" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "nls_cp437" "nls_iso8859_1" ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/58f899b4-0e0b-4115-bb4c-a6ae494ce23a";
      fsType = "ext4";
    };

    "/boot" = boot // {
      options = [ "noauto" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/414a85ff-69a3-4eb3-baec-83b8fadf0f72";
      fsType = "ext4";
    };

    "/var" = {
      device = "/dev/disk/by-uuid/96745560-5a4e-4413-ac71-7abecb53e611";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/2386bc78-599c-4dd4-84d9-e453626c5651";
    }
  ];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
