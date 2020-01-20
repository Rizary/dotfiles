{ pkgs, config, ... }:
let
  sessionScript = pkgs.writeScriptBin "lll" ''
    #!${pkgs.stdenv.shell}
    sudo -u ${config.primary-user.name} \
      mount ${config.primary-user.secure.device} ${config.primary-user.secure.mountPoint}

    '${pkgs.xorg.xkbcomp}/bin/xkbcomp' \ 
      -layout 'us' \
      -variant 'dvorak' 
  '';

in
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.sddm.enable = false;
  #services.xserver.displayManager.lightdm.autoLogin.enable = true;
  #services.xserver.displayManager.lightdm.autoLogin.user = "rizary";

  services.xserver.displayManager.lightdm.background = "../../../wallpaper/Rizilab/rizilab-nordic.png";

  primary-user.home-manager.xsession.scriptPath = ".hm-xsession";

  services.xserver.displayManager.session = [
    {
      manage = "window";
      name = "home-manager";
      start = ''
        ${pkgs.runtimeShell} $HOME/.hm-xsession &
        waitPID=$! 
      '';
    }
  ];

  services.xserver.displayManager.sessionCommands = "${sessionScript}/bin/lll";
}
