module WindowRules where

import XMonad ((=?), (-->))

import qualified XMonad as XMonad
import qualified XMonad.Hooks.ManageDocks as ManageDocks
import qualified XMonad.Hooks.Place as Place
import qualified XMonad.Actions.SpawnOn as SpawnOn
import qualified XMonad.Actions.WindowGo as WindowGo

myManageHook :: XMonad.ManageHook
myManageHook = XMonad.composeAll
  [ placeNewFloatsUnderMouse
  , floatsManageHook
  , programManageHook
  , ManageDocks.manageDocks
  ]

floatsManageHook :: XMonad.ManageHook
floatsManageHook = XMonad.composeAll $ map (--> XMonad.doFloat)
  [ ]

programManageHook :: XMonad.ManageHook
programManageHook = XMonad.composeAll 
  [ XMonad.className =? "Firefox" --> XMonad.doShift "\xf0ac"
  ]

-- Place new floating windows under the middle of the mouse
placeNewFloatsUnderMouse :: XMonad.ManageHook
placeNewFloatsUnderMouse =
  Place.placeHook $ Place.inBounds $ Place.underMouse (0.5, 0.5)


-- Place for Startup hook
myStartupHook = do
  (WindowGo.ifWindow (XMonad.className =? "Firefox") myManageHook (SpawnOn.spawnOn "\xf0ac" "firefox"))
