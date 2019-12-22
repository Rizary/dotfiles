let niv-pinned-git = builtins.fromJSON (builtins.readFile ./github.json);
    nivSrc = (builtins.fetchGit { inherit (niv-pinned-git) url rev; });
    sources = import "${nivSrc}/niv/sources.nix" {
      sourcesFile = ./sources.json;
    };
    niv = import nivSrc {};
in niv // sources


