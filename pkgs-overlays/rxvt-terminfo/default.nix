self: super: {
  setterminfo = super.callPackage ./setterminfo.nix {
    terminfo = self.rxvt_unicode.terminfo;
  };
}
