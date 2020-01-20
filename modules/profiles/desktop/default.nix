{ ... }:
{
  imports = [
    # base is a common thing for all profiles
    ../base-desktop

    ../../config/data/theme

    ../../config/boot/systemd-boot
    ../../config/boot/logind

    ../../config/data/xdg-user-dirs

    # networking
    ../../hardware/network/lan
    ../../hardware/monitors

    # desktop security
    ../../security/gpg
    ../../security/pass
    ../../security/secure
    ../../security/ssh
    ../../security/sshd

    # databases
    ../../databases/mongodb
    ../../databases/postgresql

    # binary caches for development
    ../../config/nix/binary-cache

    # programs related to desktop configuration
    #../../programs/all-fonts
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
    ../../programs/xclip
    ../../programs/xmonad
    ../../programs/xorg
    ../../programs/fzf
    ../../programs/firefox
    ../../programs/chromium
    ../../programs/mpv
    ../../programs/ranger
    ../../programs/redshift
    ../../programs/flameshot
    ../../programs/xdotool
    ../../programs/playerctl
    ../../programs/obs-studio

    ../../printers
    ../../virtualisation

    # timezone
    ../../config/locale
  ];

  primary-user.secure.enableMount = true;
}
