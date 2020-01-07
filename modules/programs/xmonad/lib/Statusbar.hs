module Statusbar where

import qualified Data.List as List
import qualified Data.Maybe as Maybe
import qualified GHC.IO.Handle.Types as HandleTypes
import qualified Workspaces as Workspaces
import qualified XMonad as XMonad
import qualified XMonad.Actions.WorkspaceNames as WorkspaceNames
import qualified XMonad.Hooks.DynamicLog as DynamicLog
import qualified XMonad.Util.Run as Run
import qualified Theme as Theme

-- Set up status bar output
statusbar :: XMonad.X String
statusbar = statusbarPlugins options >>= DynamicLog.dynamicLogString
  where
    options = DynamicLog.xmobarPP
      { DynamicLog.ppSep = "    "
      , DynamicLog.ppLayout = showLayout
      , DynamicLog.ppCurrent = showCurrentWorkspace
      , DynamicLog.ppHidden = showHiddenWorkspace
      , DynamicLog.ppHiddenNoWindows = showHiddenNoWindows
      , DynamicLog.ppTitle = showTitle
      , DynamicLog.ppOrder = \(ws:l:t:_) -> [l, t, ws]
      }

-- Plugins that apply to status bar output
statusbarPlugins :: DynamicLog.PP -> XMonad.X DynamicLog.PP
statusbarPlugins = WorkspaceNames.workspaceNamesPP

-- Make layout indicator clickable
showLayout :: String -> String
showLayout = DynamicLog.wrap "<action=xdotool key 'super+Tab'>" "</action>"

-- Highlight visible workspace
showCurrentWorkspace :: XMonad.WorkspaceId -> String
showCurrentWorkspace = DynamicLog.wrap ("<fc=" ++ Theme.base08 ++ ">[") "]</fc>"

-- Make workspace clickable
showHiddenWorkspace :: XMonad.WorkspaceId -> String
showHiddenWorkspace workspace =
  DynamicLog.wrap ("<action=`xdotool key 'super+" ++ key ++ "'`> ") " </action>" workspace
  where
    key = Maybe.fromMaybe "" $
      XMonad.keysymToString <$> snd <$> List.find ((== workspace) . fst) Workspaces.workspaces

showHiddenNoWindows :: XMonad.WorkspaceId -> String
showHiddenNoWindows =
  DynamicLog.wrap ("<fc=" ++ Theme.base03 ++ ">") "</fc>"

-- Color and ellipsize the title
showTitle :: String -> String
showTitle
  = DynamicLog.xmobarColor Theme.base10 ""
  . DynamicLog.shorten 100
