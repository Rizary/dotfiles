{ pkgs, ... }:
{
  nix = rec {
	  # use nix flake edition
	  package = pkgs.nixUnstable;

	  # adding features on nix config
	  extraOptions = ''
	    keep-outputs = true
		keep-derivations = true
		experimental-features = nix-command flake recursive-nix
	  '';
  };
}
