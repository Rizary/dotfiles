{ pkgs, ... }:
{
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.extraModules = [ pkgs.pulseaudio-modules-bt ];
  hardware.pulseaudio.daemon.config = {
    flat-volumes = "no";
    default-sample-format = "s24le";
    default-sample-rate = "192000";
  };
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  primary-user.extraGroups = [ "audio" ];

  sound.enable = true;
}
