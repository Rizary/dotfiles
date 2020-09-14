{ lib, config, pkgs, ... }:
let cfg = config.primary-user;
in
{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.git ];
  primary-user.home-manager.programs.git.enable = true;
  primary-user.home-manager.programs.git.userName = "${cfg.name}";
  primary-user.home-manager.programs.git.userEmail = "andika.riyan@gmail.com";
  primary-user.home-manager.programs.git.extraConfig = {
    core = {
      autocrlf = false;
      excludesFile = "/home/${cfg.name}/.gitignore_global";
    };
  };
  primary-user.home-manager.home.file.".gitignore_global" = {
    source = ./gitignore_global;
  };
}
