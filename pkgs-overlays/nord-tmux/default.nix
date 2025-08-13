_: super: {
  tmuxPlugins = super.tmuxPlugins // {
    nord-tmux = super.callPackage ./nord-tmux.nix { };
  };
}
