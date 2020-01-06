{ config, pkgs, ... }:

let
  xmonadSrc = config.primary-user.home-manager.home.file.".xmonad/xmonad.hs";
  profileName = config.primary-user.name;

in
{
  primary-user.home-manager.home.file.".xmonad/lib" = {
    source = ./lib;
    recursive = true;
    onChange = xmonadSrc.onChange;
  };

  primary-user.home-manager.xsession = {
    enable = true;

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hp: [
        hp.xmonad
        hp.xmonad-contrib
        hp.xmonad-extras
        hp.taffybar
        hp.dbus
      ];
      config =
        let
          profileMask = if profileName == "hyperv"
          then "mod1Mask"
          else "mod4Mask";
        in
          pkgs.writeText "xmonad.hs" ''
            import qualified Paths as Paths
            import qualified WindowManager as WindowManager
      
            main :: IO ()
            main = WindowManager.start myModMask

            myModMask = XMonad.${profileMask}
          '';
    };
  };
}
