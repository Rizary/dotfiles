module Statusbar where

import qualified Data.List as List
import qualified Data.Maybe as Maybe
import qualified GHC.IO.Handle.Types as HandleTypes
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
      { DynamicLog.ppSep = " \xf22d "
      , DynamicLog.ppLayout = showLayout
      , DynamicLog.ppCurrent = showCurrentWorkspace
      , DynamicLog.ppHidden = showHiddenWorkspaceWithWindows
      , DynamicLog.ppHiddenNoWindows = showHiddenWorkspaceWithNoWindows
      , DynamicLog.ppTitle = showTitle
      , DynamicLog.ppOrder = \(ws:l:t:_) -> [l, t, ws]
      --, DynamicLog.ppOutput = \x -> DynamicLog.xmobarStrip x
      }

-- Plugins that apply to status bar output
statusbarPlugins :: DynamicLog.PP -> XMonad.X DynamicLog.PP
statusbarPlugins = WorkspaceNames.workspaceNamesPP

-- Make layout indicator clickable
showLayout :: String -> String
showLayout =
  (\layout -> case layout of
        "Fullscreen" -> "[^]"
        "Tabbed" -> "[_]"
        "Three Columns" -> "[| |]"
        "Binary Partition" -> "[-]"
        "Tall" -> "[|]"        
  )
  -- DynamicLog.xmobarAction "xdotool key super+tab" "1"
  --DynamicLog.wrap "<action=xdotool key 'super+Tab'>" "</action>"

-- Highlight visible workspace
showCurrentWorkspace :: XMonad.WorkspaceId -> String
showCurrentWorkspace = DynamicLog.wrap ("<fc=" ++ Theme.base08 ++ ">[") "]</fc>"

-- Make workspace clickable
showHiddenWorkspaceWithWindows :: XMonad.WorkspaceId -> String
showHiddenWorkspaceWithWindows =
  DynamicLog.wrap ("<fc=" ++ Theme.base13 ++ ">") "</fc>"

showHiddenWorkspaceWithNoWindows :: XMonad.WorkspaceId -> String
showHiddenWorkspaceWithNoWindows =
  DynamicLog.wrap ("<fc=" ++ Theme.base03 ++ ">") "</fc>"

-- Color and ellipsize the title
showTitle :: String -> String
showTitle
  = DynamicLog.xmobarColor Theme.base07 ""
  . DynamicLog.shorten 100
  . (\x -> if null x then "Rizary @ Rizilab" else x)
