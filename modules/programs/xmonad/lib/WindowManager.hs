module WindowManager where

import qualified Keybindings as Keybindings
import qualified Layouts as Layouts
import qualified Mousebindings as Mousebindings
import qualified Statusbar as Statusbar
import qualified WindowRules as WindowRules
import qualified Workspaces as Workspaces
import qualified XMonad as XMonad
import qualified XMonad.Actions.Navigation2D as Navigation2D
import qualified XMonad.Hooks.EwmhDesktops as EwmhDesktops
import qualified XMonad.Hooks.ManageDocks as ManageDocks
import qualified XMonad.Hooks.DynamicLog as DynamicLog
import qualified XMonad.Config.Desktop as ConfigDesktop
import qualified XMonad.Util.Run as Run

import Theme

start myModMask = --startXmobar paths >>=
  startXmonad myModMask

--startXmobar = Run.spawnPipe . Paths.xmobar

startXmonad myModMask =
  XMonad.xmonad $ wmPlugins $ XMonad.def
  { XMonad.workspaces = Workspaces.workspaces
  , XMonad.modMask = myModMask
  , XMonad.terminal = "urxvt"
  , XMonad.borderWidth = 3
  , XMonad.normalBorderColor = Theme.base03
  , XMonad.focusedBorderColor = Theme.base07 
  , XMonad.keys = Keybindings.keybindings
  , XMonad.mouseBindings = Mousebindings.mousebindings
  , XMonad.layoutHook = Layouts.layoutHook
  , XMonad.manageHook = WindowRules.myManageHook
  , XMonad.startupHook = WindowRules.myStartupHook
  , XMonad.logHook = Statusbar.statusbar >>= DynamicLog.xmonadPropLog
  }

-- WM-level plugins
wmPlugins
  = ManageDocks.docks -- Make the status bar work well
  . EwmhDesktops.ewmh -- Implement EWMH for workspace support, xdotool, etc.
  -- . PagerHints.pagerHints -- Implement taffybar

  -- Enable directional navigation
  . Navigation2D.withNavigation2DConfig Navigation2D.def
    { Navigation2D.defaultTiledNavigation = Navigation2D.centerNavigation
    }
