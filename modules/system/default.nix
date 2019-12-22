{ ... }:
{
  imports = [
    ./nixos/crypt-initrd
    ./nixos/keymap
    ./nixos/primary-user
    ./nixos/secure
    ./nixos/sudo-cmds
    ./nixos/fonts
  ];

  primary-user.home-manager = _: {
    imports = [
      ./home-manager/default-terminal
    ];
  };

}
