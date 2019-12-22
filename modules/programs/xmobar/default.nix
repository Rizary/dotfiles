{ ... }:
{
  primary-user.home-manager.home.file.".xmonad/xmobar.hs" = {
    source = ./xmobar.hs;
    recursive = true;
  };
}
