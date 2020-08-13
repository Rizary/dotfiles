{ pkgs, lib, ... }:
let
  userSettings = import ./settings.nix;
  marketPlaceExt = import ./marketplace-extensions.nix {
    inherit (pkgs) vscode-utils;
    inherit lib;
  };
  vscodeInsiders = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (
    oldAttrs: rec {
      pname = "vscode-insiders";
      executableName = "code-insiders";
      longName = "Visual Studio Code - Insiders";
      shortName = "Code - Insiders";
      src = pkgs.fetchurl {
        name = "VSCode_latest_linux-x64.tar.gz";
        url = "https://vscode-update.azurewebsites.net/latest/linux-x64/insider";
        sha256 = "1d16jmm3h12hrvlmknh6jpcs1mg0vy2bhmbphrmzk6kjqz98cgz1";
      };
    }
  );
in
{
  primary-user.home-manager.home.packages = lib.mkForce [ vscodeInsiders ];
  primary-user.home-manager.programs.vscode.enable = true;
  primary-user.home-manager.programs.vscode.package = vscodeInsiders;
  primary-user.home-manager.programs.vscode.userSettings = userSettings;
  primary-user.home-manager.programs.vscode.extensions = with pkgs.vscode-extensions; [
    #bbenoist.Nix
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-vscode.cpptools
    ms-vscode-remote.remote-ssh
    redhat.vscode-yaml
    vscodevim.vim
    matklad.rust-analyzer
    llvm-org.lldb-vscode
    WakaTime.vscode-wakatime
    bbenoist.Nix
    ms-python.python
  ] ++ (
    with marketPlaceExt; [
      crates
      better-toml
      vscode-deno
    ]
  );

}
