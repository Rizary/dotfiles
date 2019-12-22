{ pkgs, ... }:
{
  primary-user.home-manager.services.screen-locker.enable = true;
  primary-user.home-manager.services.screen-locker.lockCmd = "${pkgs.lock-screen}/bin/lock-screen";
  primary-user.home-manager.services.screen-locker.inactiveInterval = 10;
}
