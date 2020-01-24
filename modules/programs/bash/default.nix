{ ... }:
{
  primary-user.home-manager.programs.bash.enable = true;
  primary-user.home-manager.programs.bash.enableAutojump = true;
  primary-user.home-manager.programs.bash.initExtra = '' 
    setxkbmap -layout us -variant dvorak
  '';

}
