{ ... }:
{
  primary-user.home-manager.programs.bash.enable = true;
  primary-user.home-manager.programs.bash.enableAutojump = true;
  primary-user.home-manager.programs.bash.initExtra = '' 
    setxkbmap -layout dvorak,ara -variant dvorak -option grp:alt_space_toggle,grp_led:scroll
  '';

}
