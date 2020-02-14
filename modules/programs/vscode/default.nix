{ pkgs, lib, ... }:
let
  userSettings = import ./settings.nix;
  marketPlaceExt = import ./marketplace-extensions.nix {
    inherit (pkgs) vscode-utils;
    inherit lib;
  };
in
{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.vscode ];
  primary-user.home-manager.programs.vscode.enable = true;
  primary-user.home-manager.programs.vscode.package = pkgs.vscode;
  primary-user.home-manager.programs.vscode.userSettings = userSettings;
  primary-user.home-manager.programs.vscode.extensions = with pkgs.vscode-extensions; [
    bbenoist.Nix
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-vscode.cpptools
    ms-vscode-remote.remote-ssh
    redhat.vscode-yaml
    vscodevim.vim
  ] ++ (
    with marketPlaceExt; [
      crates
      better-toml

    ]
  );

}
