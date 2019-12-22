{ ... }:

let umask = "umask 077";
in
{
  primary-user.home-manager.home.file.".profile".text = umask;
  primary-user.home-manager.home.file.".bashrc".text = umask;
  primary-user.home-manager.programs.fish.shellInit = umask;

}
