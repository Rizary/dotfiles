{ pkgs, lib, config, ... }:
let
  userSettings = import ./settings.nix { inherit pkgs config; };
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
        sha256 = "1l6kpfhzwndl91vafps72dvp7nx66jvlj9q3hxxzngpcasdx8q1s";
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
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-vscode.cpptools
    ms-vscode-remote.remote-ssh
    redhat.vscode-yaml
    matklad.rust-analyzer
    llvm-org.lldb-vscode
    bbenoist.Nix
    ms-python.python
  ] ++ (
    with marketPlaceExt; [
      crates
      better-toml
      vscode-deno
      vscode-cloak
      dotenv
      pale-fire-dark
      dart-code
      flutter
      vscode-direnv
      fzf-quick-open
      haskell
      language-haskell
      go
    ]
  );

}
