module Keybindings where

import XMonad ((.|.))
import XMonad.Config (def)

import qualified Data.List as List
import qualified Data.Map as Map
import qualified Data.Maybe as Maybe
import qualified Graphics.X11.ExtraTypes.XF86 as XF86
import qualified Workspaces as Workspaces
import qualified XMonad as XMonad
import qualified XMonad.Actions.Navigation2D as Navigation2D
import qualified XMonad.Layout.Maximize as Maximize
import qualified XMonad.Layout.MouseResizableTile as MouseResizableTile
import qualified XMonad.Layout.MultiToggle as MultiToggle
import qualified XMonad.Layout.MultiToggle.Instances as MultiToggleInstances
import qualified XMonad.StackSet as StackSet

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
 -- XMonad.KeyMask ->
  XMonad.XConfig XMonad.Layout ->
  Map.Map (XMonad.ButtonMask, XMonad.KeySym) (XMonad.X ())
keybindings screenId conf@(XMonad.XConfig {XMonad.modMask = modM}) = Map.fromList $

  -- Switch layouts
  [ ((modM, XMonad.xK_Tab), XMonad.sendMessage XMonad.NextLayout)
  , ((modM .|. XMonad.shiftMask, XMonad.xK_Tab), goPreviousLayout)

  -- 
  -- Launch emacs
  , ((modM .|. controlMask, xK_e), spawn "@emacs@")
  -- Floating/fullscreen toggle
  , ((modM, XMonad.xK_space), Navigation2D.switchLayer)
  , ((modM .|. XMonad.shiftMask, XMonad.xK_space), XMonad.withFocused toggleFloating) -- make focused window float
  , ((modM, XMonad.xK_f), XMonad.withFocused (XMonad.sendMessage . Maximize.maximizeRestore))
  , ((modM .|. XMonad.shiftMask, XMonad.xK_f), XMonad.sendMessage $ MultiToggle.Toggle MultiToggleInstances.FULL)


  -- Close window
  , ((modM .|. XMonad.shiftMask, XMonad.xK_q), XMonad.kill)

  , ((modM, XMonad.xK_Return), XMonad.spawn $ "urxvt")

  -- Screen Locker
  , ((modM .|. XMonad.shiftMask, XMonad.xK_Return), XMonad.spawn $ "i3lock-fancy")
  
  -- Browser
  , ((modM .|. XMonad.shiftMask, XMonad.xK_F), XMonad.spawn $ "firefox")
  , ((modM .|. XMonad.shiftMask, XMonad.xK_G), XMonad.spawn $ "google-chrome-unstable")


  -- Restart XMonad
  , ((modM, XMonad.xK_r), XMonad.restart "xmonad" True)

  ] ++

  -- Switch workspace with mod + workspace key
  -- Move windows to other workspaces with mod + shift + workspace key
  [((m .|. modM, k), XMonad.windows $ (if screenId == 1 then id else onCurrentScreen) f i)
  | (i,k) <- zip (XMonad.workspaces conf) [XMonad.xK_F1..XMonad.xK_F12] -- ++ [XMonad.xK_F1, XMonad.xK_F2])
  , (f,m) <- [(StackSet.greedyView, 0), (StackSet.shift, XMonad.shiftMask)]
  ]
  
  


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
