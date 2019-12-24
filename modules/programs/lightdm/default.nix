{ pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.sddm.enable = false;
  #services.xserver.displayManager.lightdm.autoLogin.enable = true;
  #services.xserver.displayManager.lightdm.autoLogin.user = "rizary";
  services.xserver.desktopManager.session = [
    {
      name = "home-manager";
      start = ''
        ${pkgs.runtimeShell} $HOME/.hm-xsession &
        waitPID=$!
      '';
    }
  ];
  primary-user.home-manager.xsession.scriptPath = ".hm-xsession";
}
