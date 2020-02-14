_: super: rec {
  vscode = (super.vscode.override { isInsiders = true; }).overrideAttrs (
    _: rec {
      name = "vscode-insiders-${version}";
      version = "1.41.1";
      pname = "vscode-insiders";

      src = super.fetchurl {
        name = "VSCode_latest_linux-x64.tar.gz";
        url = "https://vscode-update.azurewebsites.net/latest/linux-x64/insider";
        sha256 = "0jfhlcaaqh37w0q2y1i93zlcgw31qr7ipwhak9n388s5lkfqkvkw";
      };
    }
  );
}
