{ ... }:
{
  # Binary cache configuration
  nix.binaryCaches = [ "https://cache.nixos.org/"
                       "https://nixcache.reflex-frp.org"
                       "https://all-hies.cachix.org/"
                       "https://cache.dhall-lang.org"
                       "https://hercules-ci.cachix.org"
                       "https://jupyterwith.cachix.org"
                       "https://miso-haskell.cachix.org"
                     ];
  nix.trustedUsers = [ "root" "rizilab" ];
  nix.binaryCachePublicKeys = [ "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="
                                "all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k="
                                "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
                                "miso-haskell.cachix.org-1:6N2DooyFlZOHUfJtAx1Q09H0P5XXYzoxxQYiwn6W1e8="
                                "hercules-ci.cachix.org-1:ZZeDl9Va+xe9j+KqdzoBZMFJHVQ42Uu/c/1/KMC5Lw0="
                                "jupyterwith.cachix.org-1:/kDy2B6YEhXGJuNguG1qyqIodMyO4w8KwWH4/vAc7CI="
                              ];

  system.stateVersion = "19.09"; #Why you read the comment?
}
