{ pkgs, lib, ... }:

{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.fzf ];
  primary-user.home-manager.programs.fzf.enable = true;
  primary-user.home-manager.programs.fzf.inline-info = true;
}
