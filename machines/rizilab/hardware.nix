{ pkgs, lib, ... }:

let
  boot = {
    device = "/dev/disk/by-uuid/31DB-5F66";
    fsType = "vfat";
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
      device = "/dev/disk/by-uuid/c54c75e1-7d3f-461f-a95c-bcfec8ecba9a";
      fsType = "ext4";
    };

    "/boot" = boot // {
      options = [ "noauto" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/1e8a4c25-733b-4571-9586-fd210c858581";
      fsType = "ext4";
    };

    "/var" = {
      device = "/dev/disk/by-uuid/faf29f4a-44f9-4703-8c07-2f257aa51fa2";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/ec587887-96e6-43d3-b48b-caa1c678af11";
    }
  ];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
