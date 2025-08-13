{ config, lib, ... }:
<<<<<<< HEAD

let cfg = config.primary-user;
=======
let
  cfg = config.primary-user;
>>>>>>> flakes
in
{
  options.primary-user.name = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "the name of the primary user account.";
  };

  imports = [
    (lib.mkAliasOptionModule [ "primary-user" "home-manager" ] [ "home-manager" "users" cfg.name ])
    (lib.mkAliasOptionModule [ "primary-user" "sudo-cmds" ] [ "sudo-cmds" cfg.name ])
<<<<<<< HEAD
    (lib.mkAliasOptionModule [ "primary-user" "secure" ] [ "secure" cfg.name ])
    (lib.mkAliasOptionModule [ "primary-user" "home" ] [ "users" "users" cfg.name "home" ])
    (lib.mkAliasOptionModule [ "primary-user" "shell" ] [ "users" "users" cfg.name "shell"])
    (lib.mkAliasOptionModule [ "primary-user" "extraGroups" ] ["users" "users" cfg.name "extraGroups" ])
    (lib.mkAliasOptionModule [ "primary-user" "uid"] [ "users" "users" cfg.name "uid" ])
=======
    #(lib.mkAliasOptionModule [ "primary-user" "secure" ] [ "secure" cfg.name ])
    (lib.mkAliasOptionModule [ "primary-user" "home" ] [ "users" "users" cfg.name "home" ])
    (lib.mkAliasOptionModule [ "primary-user" "shell" ] [ "users" "users" cfg.name "shell" ])
    (lib.mkAliasOptionModule [ "primary-user" "extraGroups" ] [ "users" "users" cfg.name "extraGroups" ])
    (lib.mkAliasOptionModule [ "primary-user" "uid" ] [ "users" "users" cfg.name "uid" ])
    (lib.mkAliasOptionModule [ "primary-user" "openssh" ] [ "users" "users" cfg.name "openssh" ])
>>>>>>> flakes
  ];

  config.primary-user.extraGroups = lib.mkIf (cfg.name != null) ([ "wheel" ]);
  config.primary-user.uid = lib.mkIf (cfg.name != null) (lib.mkDefault 1000);
<<<<<<< HEAD
  config.users.users.${cfg.name}.isNormalUser = true;
  config.users.users.${cfg.name}.createHome = true;
  config.users.users.${cfg.name}.home = "/home/${cfg.name}";
  nix.trustedUsers = [ "root" cfg.name ];
=======
  config.users.users.${cfg.name}.isNormalUser = lib.mkIf (cfg.name != null) true;
  config.nix.trustedUsers = [ "root" cfg.name ];
>>>>>>> flakes
}
