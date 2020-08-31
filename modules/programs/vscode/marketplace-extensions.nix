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

  vscode-cloak = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "vscode-cloak";
      publisher = "johnpapa";
      version = "0.3.0";
      sha256 = "0hxyasf2hjsic4xjjc1jjf64rb13jifjplila9znpkj073r139v2";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  dotenv = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "dotenv";
      publisher = "mikestead";
      version = "1.0.1";
      sha256 = "0rs57csczwx6wrs99c442qpf6vllv2fby37f3a9rhwc8sg6849vn";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  pale-fire-dark = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "pale-fire-dark";
      publisher = "dhruvdh";
      version = "0.1.12";
      sha256 = "0wndhmqdsf362xxi76yvvyxadl9knl7vw3s4jzy5c8ra8an81dsh";
    };
    meta = {
      license = lib.licenses.gpl3;
    };
  };

  dart-code = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "dart-code";
      publisher = "dart-code";
      version = "3.13.2";
      sha256 = "05pyqijwkqby4q9izkddkrhlfd0jhdc1xqdf6342l1r7p8bwyqyr";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  flutter = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "flutter";
      publisher = "dart-code";
      version = "3.13.2";
      sha256 = "1jpb01a3fazwi89b2f59sm8sbzbfaawdxaais53dsay1wbg5hncz";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  vscode-direnv = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "vscode-direnv";
      publisher = "rubymaniac";
      version = "0.0.2";
      sha256 = "1gml41bc77qlydnvk1rkaiv95rwprzqgj895kxllqy4ps8ly6nsd";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  fzf-quick-open = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "fzf-quick-open";
      publisher = "rlivings39";
      version = "0.4.0";
      sha256 = "1wv5fan4lqssiik64kxf0gb0rgbrx6bfaha0shi6cc7dfp7b6yhm";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  haskell = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "haskell";
      publisher = "haskell";
      version = "1.1.0";
      sha256 = "1wg06lyk0qn9jd6gi007sg7v0z9z8gwq7x2449d4ihs9n3w5l0gb";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };

  go = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "go";
      publisher = "golang";
      version = "0.16.1";
      sha256 = "1jqg0kq5ivkzqpbyppx48am79vkg68hm54l4ffwfm58xlak8a46y";
    };
    meta = {
      license = lib.licenses.mit;
    };
  };
}
