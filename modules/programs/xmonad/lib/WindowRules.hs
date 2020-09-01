module WindowRules where

import XMonad ((=?), (-->))

import qualified XMonad as XMonad
import qualified XMonad.Hooks.ManageDocks as ManageDocks
import qualified XMonad.Config.Prime as Prime
import qualified XMonad.Hooks.Place as Place
import qualified XMonad.Actions.SpawnOn as SpawnOn
import qualified XMonad.Util.SpawnOnce as SpawnOnce
import qualified XMonad.Actions.WindowGo as WindowGo
import qualified XMonad.Hooks.DynamicBars as Bars
import qualified XMonad.Util.Run as Run
import qualified Paths as Paths

myManageHook :: XMonad.ManageHook
myManageHook = XMonad.composeAll
  [ placeNewFloatsUnderMouse
  , floatsManageHook
  , programManageHook
  , ManageDocks.manageDocks
  ]

floatsManageHook :: XMonad.ManageHook
floatsManageHook = XMonad.composeAll $ map (--> XMonad.doFloat)
  [ (XMonad.className =? "pavucontrol-qt") ]

programManageHook :: XMonad.ManageHook
programManageHook = XMonad.composeAll
  [ --(XMonad.className =? "Firefox") --> XMonad.doShift "\xf0ac"
    (XMonad.className =? "Google-chrome-unstable") --> XMonad.doShift "\xf144"
  ]

-- Place new floating windows under the middle of the mouse
placeNewFloatsUnderMouse :: XMonad.ManageHook
placeNewFloatsUnderMouse =
  Place.placeHook $ Place.inBounds $ Place.underMouse (0.5, 0.5)



------------------
-- Startup hook --
------------------

myStartupHook :: Paths.Paths -> Prime.X ()
myStartupHook paths = do
    (WindowGo.ifWindow (XMonad.className =? "Firefox") myManageHook (SpawnOn.spawnOn "\xf0ac" "firefox"))
    (WindowGo.ifWindow (XMonad.className =? "Google-chrome-unstable") myManageHook (SpawnOn.spawnOn "\xf144" "google-chrome-unstable"))
    Bars.dynStatusBarStartup (xmobarCreator paths) xmobarDestroyer
    SpawnOnce.spawnOnce "xrandr --output Virtual-1 --mode \"1920x1080\""
    SpawnOnce.spawnOnce "autorandr -c"


xmobarCreator :: Paths.Paths -> Bars.DynamicStatusBar
xmobarCreator paths (Prime.S sid) = Run.spawnPipe $ (Paths.xmobar paths) ++ " -x " ++ show sid

xmobarDestroyer :: Bars.DynamicStatusBarCleanup
xmobarDestroyer = return ()
