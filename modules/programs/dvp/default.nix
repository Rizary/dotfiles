{ config, ... }:
{
  keymap.layout = "us";
  keymap.variant = "dvp";
  keymap.options = "caps:escape";
  primary-user.home-manager.keymap = config.keymap;
}
