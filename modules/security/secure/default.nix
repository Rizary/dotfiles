{ ... }:
{
  primary-user.secure.mountPoint = "/secure";
  primary-user.secure.device = "/dev/disk/by-uuid/3fc4b0f6-061b-4375-950b-84ab9826736b";
  primary-user.secure.fsType = "ext4";
  primary-user.secure.options = [ "noauto" ];
}
