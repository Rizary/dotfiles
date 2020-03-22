{ config, ... }:
{
  keymap.layout = "dvorak,ara";
  keymap.variant = "dvorak";
  keymap.options = "eurosign:e,grp:alt_space_toggle,grp_led:scroll";
  primary-user.home-manager.keymap = config.keymap;
}
