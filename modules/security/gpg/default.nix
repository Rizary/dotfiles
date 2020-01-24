{ pkgs, lib, ... }:
let
  gnupg = pkgs.symlinkJoin {
    name = "gnupg";
    paths = [ pkgs.gnupg ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/gpg-agent \
        --add-flags "--options ~/.gnupg/gpg-agent.conf"
      wrapProgram $out/bin/gpg \
        --add-flags "--options ~/.gnupg/gpg.conf"
    '';
  };
in
{
  primary-user.home-manager = {
    home.packages = lib.mkForce [ gnupg ];
    programs.gpg.enable = true;
    services.gpg-agent.enable = true;
    services.gpg-agent.enableSshSupport = true;
    services.gpg-agent.extraConfig = ''
      allow-emacs-pinentry
      allow-loopback-pinentry
    '';
  };
}
