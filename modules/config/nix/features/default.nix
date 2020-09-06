{ ... }:
{
  # Binary cache configuration
  nix.systemFeatures = [
    "nix-command"
    "flakes"
  ];
}
