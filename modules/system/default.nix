{ ... }:
{
  imports = [
    ./nixos/crypt-initrd
    ./nixos/color-theme
    ./nixos/keymap
    ./nixos/primary-user
    ./nixos/secure
    ./nixos/sudo-cmds
    ./nixos/fonts
  ];

  primary-user.home-manager = _: {
    imports = [
      ./home-manager/color-theme
      ./home-manager/default-terminal
      ./home-manager/icon-theme
      ./home-manager/keymap
      ./home-manager/font
      ./home-manager/fzf
      ./home-manager/scripts
      ./home-manager/xmobar
    ];
  };

}
