{ ... }:

{
  # This imports contain all nixos setup needed for desktop configuration
  imports = [
    ./hardware.nix
    ../../modules/profiles/desktop
  ];
  primary-user.name = "rizary";
  networking.hostName = "rizilab";
}
