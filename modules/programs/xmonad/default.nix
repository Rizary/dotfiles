{ config, pkgs, ... }:

let
  #profileName = config.primary-user.name;
  xmonadScripts = {
    emacs = ''
      if ! [ $(systemctl --user is-active emacs) = active ]; then
      systemctl --user start emacs
      fi
      emacsclient -c -n
    '';
    terminal = "urxvt";
    xmobar = config.primary-user.home-manager.programs.xmobar.command;
  };
in
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
      config = pkgs.runCommand "xmonad.hs" (config.primary-user.home-manager.scripts // xmonadScripts) "substituteAll ${./xmonad.hs} $out";
    };
  };
}
