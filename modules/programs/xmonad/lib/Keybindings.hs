module Keybindings where

import XMonad ((.|.), whenJust)
import XMonad.Config (def)

import qualified Data.List as List
import qualified Data.Map as Map
import qualified Data.Maybe as Maybe
import qualified Graphics.X11.ExtraTypes.XF86 as XF86
import qualified Workspaces as Workspaces
import qualified XMonad as XMonad
import qualified XMonad.Operations as Operations
import qualified XMonad.Config.Prime as Prime
import qualified XMonad.Actions.Navigation2D as Navigation2D
import qualified XMonad.Layout.Maximize as Maximize
import qualified XMonad.Layout.IndependentScreens as IndependentScreens
import qualified XMonad.Layout.MouseResizableTile as MouseResizableTile
import qualified XMonad.Layout.MultiToggle as MultiToggle
import qualified XMonad.Layout.MultiToggle.Instances as MultiToggleInstances
import qualified XMonad.StackSet as StackSet
import qualified XMonad.Actions.WindowBringer as WindowBringer

-- Vim-style mapping from keybinding to direction.
directions :: [(Navigation2D.Direction2D, XMonad.KeySym)]
directions =
  [ (Navigation2D.D, XMonad.xK_j)
  , (Navigation2D.U, XMonad.xK_k)
  , (Navigation2D.L, XMonad.xK_h)
  , (Navigation2D.R, XMonad.xK_l)
  ]

-- List bound keys.
keybindings ::
  Prime.ScreenId ->
  XMonad.XConfig XMonad.Layout ->
  Map.Map (XMonad.ButtonMask, XMonad.KeySym) (XMonad.X ())
keybindings screenId conf@(XMonad.XConfig {XMonad.modMask = modM}) = Map.fromList $

  -- Switch layouts
  [ ((modM, XMonad.xK_Tab), XMonad.sendMessage XMonad.NextLayout)
  , ((modM .|. XMonad.shiftMask, XMonad.xK_Tab), goPreviousLayout)

  --
  -- Launch emacs
  , ((modM .|. XMonad.controlMask, XMonad.xK_c), XMonad.spawn "emacs ~/Projects")
  , ((modM .|. XMonad.controlMask, XMonad.xK_e), XMonad.spawn "code-insiders ~/Projects")
  -- Floating/fullscreen toggle
  , ((modM, XMonad.xK_space), Navigation2D.switchLayer)
  , ((modM .|. XMonad.shiftMask, XMonad.xK_space), XMonad.withFocused toggleFloating) -- make focused window float
  , ((modM, XMonad.xK_f), XMonad.withFocused (XMonad.sendMessage . Maximize.maximizeRestore))
  , ((modM .|. XMonad.shiftMask .|. XMonad.controlMask, XMonad.xK_f), XMonad.sendMessage $ MultiToggle.Toggle MultiToggleInstances.FULL)


  -- Close window
  , ((modM .|. XMonad.shiftMask, XMonad.xK_q), XMonad.kill)

  , ((modM, XMonad.xK_Return), XMonad.spawn "urxvtc")

  -- Screen Locker
  , ((modM .|. XMonad.shiftMask, XMonad.xK_Return), XMonad.spawn $ "i3lock-fancy")

  -- Browser
  , ((modM .|. XMonad.shiftMask, XMonad.xK_f), XMonad.spawn $ "firefox")
  , ((modM .|. XMonad.shiftMask, XMonad.xK_g), XMonad.spawn $ "google-chrome-unstable")


  -- Restart XMonad
  , ((modM, XMonad.xK_r), XMonad.restart "xmonad" True)

  -- list existing window for switching
  , ((modM .|. XMonad.shiftMask .|. XMonad.controlMask, XMonad.xK_g), WindowBringer.gotoMenu)

  ] ++

  -- Switch workspace with mod + workspace key
  -- Move windows to other workspaces with mod + shift + workspace key
  [((m .|. modM, k), XMonad.windows $ f i )--(if screenId == 1 then id else IndependentScreens.onCurrentScreen) f i)
  | (i,k) <- zip (XMonad.workspaces conf) [XMonad.xK_F1..XMonad.xK_F12] -- ++ [XMonad.xK_F1, XMonad.xK_F2])
  , (f,m) <- [(StackSet.greedyView, 0), (StackSet.shift, XMonad.shiftMask)]
  ] ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modM, key), Operations.screenWorkspace sc >>= flip whenJust (XMonad.windows . f))
      | (key, sc) <- zip [XMonad.xK_w, XMonad.xK_e, XMonad.xK_r] [0..]
      , (f, m) <- [(StackSet.view, 0), (StackSet.shift, XMonad.shiftMask)]]




withCurrentLayout cb =
  XMonad.withWindowSet $ cb . XMonad.description . StackSet.layout . StackSet.workspace . StackSet.current

-- Sink a window if it's currently floated, float it otherwise
toggleFloating window =
  XMonad.windows $ \stackset ->
    if Map.member window (StackSet.floating stackset)
      then StackSet.sink window stackset
      else StackSet.float window (StackSet.RationalRect 0.25 0.25 0.5 0.5) stackset

--
goPreviousLayout = do
  XMonad.sendMessage XMonad.NextLayout
  XMonad.sendMessage XMonad.NextLayout
