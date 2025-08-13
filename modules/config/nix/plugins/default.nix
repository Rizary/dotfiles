{ pkgs, ... }:

{
  nix.extraOptions = ''
<<<<<<< HEAD
    plugin-files = ${pkgs.nix-plugins}/lib/nix/plugins
    extra-builtins-file = ${toString ./extra-builtins.nix}
=======
    #plugin-files = ${pkgs.nix-plugins}/lib/nix/plugins
    #extra-builtins-file = ${toString ./extra-builtins.nix}
>>>>>>> flakes
  '';
}
