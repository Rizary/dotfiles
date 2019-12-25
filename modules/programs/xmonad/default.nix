{ pkgs, ... }:

{
  primary-user.home-manager.home.file.".xmonad/lib" = {
    source = ./lib;
    recursive = true;
    #onChange = primary-user.home-manager.home.file.".xmonad/xmonad.hs".onChange;
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
      ];
      config = pkgs.writeText "xmonad.hs" ''
        import XMonad
        import XMonad.Config.Desktop
  
        main :: IO ()
        main = xmonad defaults

        defaults = desktopConfig
           { terminal = myTerminal
           , borderWidth = myBorderWidth 
           }

        myTerminal = "urxvt"
        myBorderWidth = 3
      '';
    };
  };
}
