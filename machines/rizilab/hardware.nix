{ pkgs, lib, config, ... }:
let
  boot = {
    device = "/dev/disk/by-uuid/0561-68C4";
    fsType = "vfat";
  };
in
{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "kvm-intel" "tun" "fuse" ];
  boot.kernelParams = [
    "amd_iommu=on"
    "ivrs_ioapic[32]=00:14.0"
    "pcie_aspm=off"
    "iommu=soft"
    # KVM kernel
    "kvm.allow_unsafe_assigned_interrupts=1"
    "kvm.ignore_msrs=1"
    "kvm-intel.nested=1"
  ];
  boot.extraModulePackages = [];

  boot.crypt-initrd.enable = true;
  boot.crypt-initrd.device = "/dev/sdb3";
  boot.crypt-initrd.key.device = { inherit (config.primary-user.secure) device fsType; };
  boot.crypt-initrd.key.keyPath = "/biohazard";
  boot.crypt-initrd.key.headerPath = "/header.img";

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"

    # QEMU kernel
    "virtio_net"
    "virtio_pci"
    "virtio_blk"
    "virtio_scsi"
    "9p"
    "9pnet_virtio"
  ];
  boot.initrd.kernelModules = [
    "uas"
    "usbcore"
    "ext4"
    "nls_cp437"
    "nls_iso8859_1"

    # QEMU kernel
    "virtio_balloon"
    "virtio_console"
    "virtio_rng"
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/0f072f39-76e4-4446-b86c-8e4f615249a7";
      fsType = "ext4";
    };
  fileSystems."/boot" = boot // {
    options = [ "noauto" ];
  };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/41ec78c0-6142-461b-be59-89e9f71f242d";
      fsType = "ext4";
    };

  fileSystems."/var" =
    {
      device = "/dev/disk/by-uuid/e581a380-a61c-47e4-a198-04412ff40509";
      fsType = "ext4";
    };

  fileSystems."/secure" =
    {
      device = "/dev/disk/by-uuid/3fc4b0f6-061b-4375-950b-84ab9826736b";
      fsType = "ext4";
    };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/836f8914-43a1-45ee-85de-1a7e32494011";
    }
  ];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
