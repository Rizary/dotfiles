{ config, pkgs, ... }:

#let
#  #profileName = config.primary-user.name;
#  scripts = {
#    xmobar = pkgs.writeScript "xmobar" ''
#      #!${pkgs.stdenv.shell}
#      ${config.primary-user.home-manager.programs.xmobar.command}
#    '';
#    terminal = pkgs.writeScript "terminal" ''
#      #!${pkgs.stdenv.shell}
#      urxvtc
#    '';
#  };
#in
{
  primary-user.home-manager.home.file.".xmonad/lib" = {
    source = ./lib;
    recursive = true;
  };
  primary-user.home-manager.xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = pkgs.writeText "xmonad.hs" ''
        import qualified XMonad as XMonad
        import qualified WindowManager as WindowManager
        import qualified XMonad.Layout.IndependentScreens as IndependentScreens
        import Paths as Paths

        main :: IO ()
        main = do
          let myModMask = XMonad.mod1Mask
          screenId <- IndependentScreens.countScreens
          WindowManager.start screenId myModMask Paths.Paths 
            { Paths.xmobar = "${config.primary-user.home-manager.programs.xmobar.command}"
            }
           
      '';
    };
  };
}
