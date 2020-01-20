{ pkgs, ... }:
{
  primary-user.home-manager.services.redshift.enable = true;

  primary-user.home-manager.services.redshift.latitude = "-6.371971";

  primary-user.home-manager.services.redshift.longitude = "106.849631";

  primary-user.home-manager.services.redshift.provider = "manual";

  primary-user.home-manager.services.redshift.temperature.day = 4250;
  primary-user.home-manager.services.redshift.temperature.night = 3500;

  primary-user.home-manager.services.redshift.brightness.day = "0.7";
  primary-user.home-manager.services.redshift.brightness.night = "0.7";

  primary-user.home-manager.services.redshift.package = pkgs.redshift;

  primary-user.home-manager.services.redshift.extraOptions = [ "-v" "-m randr" ];

}
