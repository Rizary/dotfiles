{ ... }:
{
  imports = [
    # base is a common thing for all profiles
    ../base-desktop

    # theme
    ../../config/data/theme

    ../../config/boot/systemd-boot
    ../../config/boot/logind

    ../../config/data/xdg-user-dirs

    # networking
    ../../hardware/network/lan

    # desktop security
    ../../security/gpg
    ../../security/pass
    #../../security/secure
    ../../security/ssh
    ../../security/sshd

    # databases
    ../../databases/mongodb
    ../../databases/postgresql

    # binary caches for development
    ../../config/nix/binary-cache

    # programs related to desktop configuration
    ../../programs/audio
    ../../programs/dunst
    ../../programs/gtk
    ../../programs/lightdm
    ../../programs/log
    ../../programs/opengl
    #../../programs/rofi-pass
    ../../programs/screen-locker
    ../../programs/urxvt
    ../../programs/xmobar
    ../../programs/tmux
    ../../programs/taffybar
    ../../programs/xmonad
    ../../programs/xorg
    ../../programs/fzf
    ../../programs/firefox


    # theming and fonts related program
    ../../programs/all-fonts

    ../../printers
    ../../virtualisation


    # timezone
    ../../config/locale
  ];
}
