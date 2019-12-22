{ config, lib, pkgs, ... }:

let
  dirPath = ./.;
  home-manager-src = import "${dirPath}/deps/home-manager";
in {
  # This imports contain all nixos setup needed for desktop configuration
  imports =
    [

    ];
}
