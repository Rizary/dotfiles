{ ... }:
{
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "dvorak";
  services.xserver.xkbOptions = "eurosign:e";
  services.xserver.libinput.enable = true;
  services.xserver.libinput.naturalScrolling = false;
}
