_: super: rec {
  vscode = (super.vscode.override { isInsiders = true; }).overrideAttrs (
    _: rec {
      name = "vscode-insiders-${version}";
      version = "1.41.1";
      pname = "vscode-insiders";

      src = super.fetchurl {
        name = "VSCode_latest_linux-x64.tar.gz";
        url = "https://vscode-update.azurewebsites.net/latest/linux-x64/insider";
        sha256 = "010b3c7p4lxk3cbbvxb9q4dqxna8gwmqy5jv8c3w62k4g7x60y3l";
      };
    }
  );
}
