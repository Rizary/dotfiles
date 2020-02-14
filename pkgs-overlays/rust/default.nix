let
  sources = import ../../niv/sources.nix;
  pkgs = import sources.nixpkgs-mozilla;
in
self: super: rec {
  nightly-rust =
    (pkgs self super).rustChannelOf {
      date = "2020-01-20";
      channel = "nightly";
      sha256 = "0dav93fxfhxgvmlp6kwh6dz5v3add4n5n7x0jcfy74rrlm76rs36";
    };
}
