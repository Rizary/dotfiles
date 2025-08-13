<<<<<<< HEAD
{ config, lib, pkgs, ... }:
=======
{ lib, pkgs, ... }:
>>>>>>> flakes
with lib;
{
  imports = [ <nixpkgs/nixos/modules/profiles/hardened.nix> ];

  #KSSP kernel
  boot.kernelPackages = pkgs.linuxPackages_hardened_copperhead;

  # Hardened version is too strict with user's namespaces
  # The following config is needed for firejail and other containment tools
  boot.kernel.sysctl."user.max_user_namespaces" = 46806;
}
