{ config, ... }:
{
  keymap.layout = "us";
  keymap.variant = "dvorak";
  primary-user.home-manager.keymap = config.keymap;
}
