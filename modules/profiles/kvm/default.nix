{ ... }:
{
  imports = [
    # base is a common thing for all profiles
    ../base-desktop

    # theme
    ../../config/data/theme

    #../../config/boot/systemd-boot
    ../../config/boot/logind
    ../../config/boot/grub-boot

    ../../config/data/xdg-user-dirs

    # hardware
    ../../hardware/network/lan
    ../../hardware/monitors

    # desktop security
    #../../security/gpg
    ../../security/ssh
    ../../security/sshd

    # databases
    ../../databases/mongodb
    ../../databases/postgresql

    # binary caches for development
    ../../config/nix/binary-cache

    # programs related to desktop configuration
    ../../programs/audio
    ../../programs/evince
    ../../programs/dunst
    ../../programs/gtk
    ../../programs/lightdm
    #====== desktop/window manager
    ../../programs/xmobar
    ../../programs/xclip
    ../../programs/xmonad
    ../../programs/xorg
    #../../programs/rofi-pass
    ../../programs/screen-locker
    ../../programs/urxvt
    #../../programs/xfce
    ../../programs/log
    ../../programs/opengl
    ../../programs/xorg
    ../../programs/fzf
    ../../programs/firefox
    ../../programs/chromium
    ../../programs/mpv
    ../../programs/ranger
    ../../programs/ripgrep-all
    ../../programs/ripgrep
    ../../programs/redshift
    ../../programs/flameshot
    ../../programs/xdotool
    ../../programs/obs-studio
    ../../programs/feh
    ../../programs/playerctl
    ../../programs/vscode


    # theming and fonts related program
    ../../programs/all-fonts

    ../../printers
    ../../virtualisation


    # timezone
    ../../config/locale
  ];
}
