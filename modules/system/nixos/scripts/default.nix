{ lib, pkgs, ... }:

with lib;

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
      Scripts to be written
    '';
  };

}
