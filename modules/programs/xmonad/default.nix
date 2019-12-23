{ ... }:
{
  primary-user.home-manager.xsession.enable = true;
  primary-user.home-manager.xsession.windowManager.xmonad.enable = true;
  primary-user.home-manager.xsession.windowManager.xmonad.enableContribAndExtras = true;
  primary-user.home-manager.xsession.windowManager.xmonad.extraPackages = hp: [ hp.xmonad-contrib ];
  primary-user.home-manager.xsession.windowManager.xmonad.config = ./xmonad.hs;
}
