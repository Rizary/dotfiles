{ lib, vscode-utils }:
let
  inherit (vscode-utils) buildVscodeMarketplaceExtension;
in
{
  crates = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "crates";
      publisher = "serayuzgur";
      version = "0.4.7";
      sha256 = "1r8ywmdiy7xxq27hkjglh29hvs0c2yz5g9x1laasp43sdi056spl";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  better-toml = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "better-toml";
      publisher = "bungcip";
      version = "0.3.2";
      sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  vscode-deno = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "vscode-deno";
      publisher = "justjavac";
      version = "1.31.0";
      sha256 = "1wrs96hxcw2sww23icaimljpa44zldm39pkwywffga9ppys4h3h4";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };
}
