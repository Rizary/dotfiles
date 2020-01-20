{ lib, pkgs, ... }:

with lib;

#let

#scripts = builtins.attrValues (mapAttrs (name: path: {
#  inherit name path;
#}) config.primary-user.home-manager.scripts);

#scriptDrv = pkgs.linkFarm "scripts" scripts;

#in
{

  options.scripts = mkOption {
    type = types.attrsOf types.str;
    default = {};
    apply = mapAttrs (
      name: script: pkgs.writeScript name ''
        #!${pkgs.stdenv.shell}
        ${script}
      ''
    );
    example = literalExample ''
      hello = '''
        #!''${pkgs.bash}/bin/bash
        ''${pkgs.hello}/bin/hello
      ''';
    '';
    description = ''
      Scripts to be written to /run/current-system/<name>
    '';
  };
}
