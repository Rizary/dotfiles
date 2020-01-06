{ pkgs, ... }:
{
  primary-user.home-manager.services.screen-locker.enable = true;
  primary-user.home-manager.services.screen-locker.lockCmd = "${pkgs.i3lock-fancy}/bin/i3lock-fancy -n -c 000000";
  primary-user.home-manager.services.screen-locker.inactiveInterval = 15;
}
