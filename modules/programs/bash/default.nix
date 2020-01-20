{ config, ... }:
{
  primary-user.home-manager.programs.bash.enable = true;
  primary-user.home-manager.programs.bash.enableAutojump = true;
  primary-user.home-manager.programs.bash.initExtra = '' 
    sudo -u ${config.primary-user.name} \
      mount ${config.primary-user.secure.device} ${config.primary-user.secure.mountPoint}

    setxkbmap -layout us -variant dvorak
  '';

}
