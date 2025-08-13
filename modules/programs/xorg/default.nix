{ ... }:
{
  services.xserver.enable = true;
  services.xserver.layout = "dvorak,ara";
  services.xserver.xkbVariant = "dvorak";
  services.xserver.xkbOptions = "eurosign:e,grp:alt_space_toggle,grp_led:scroll";
  services.xserver.libinput.enable = true;
  services.xserver.libinput.naturalScrolling = false;
}
