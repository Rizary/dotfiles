module Layouts
  ( layoutHook
  ) where

import XMonad ((|||))
import XMonad.Config (def)

import qualified XMonad.Hooks.ManageDocks as ManageDocks
import qualified XMonad.Layout as Layout
import qualified XMonad.Layout.Named as Named
import qualified XMonad.Layout.DwmStyle as DwmStyle
import qualified XMonad.Layout.NoBorders as Borders
import qualified XMonad.Layout.MultiToggle as MultiToggle
import qualified XMonad.Layout.MultiToggle.Instances as MultiToggleInstances
import           XMonad.Layout.LayoutModifier (ModifiedLayout)
import qualified XMonad.Layout.Gaps as Gaps
import qualified XMonad.Layout.Spacing as Spacing
import qualified XMonad.Layout.Fullscreen as Fullscreen
import qualified XMonad.Layout.BinarySpacePartition as BSP
import qualified XMonad.Layout.ResizableTile as ResizeTile
import qualified XMonad.Layout.IfMax as IfMax
import qualified XMonad.Layout.ThreeColumns as ThreeCols
import qualified XMonad.Layout.Tabbed as Tabbed
import XMonad.Util.Types (Direction2D(..))

import Theme

data Gaps' = Gaps'
  { u :: Int
  , d :: Int
  , x :: Int
  , x' :: Integer
  }

gs :: Gaps'
gs = Gaps' { u = 20, d = 20, x = 20, x' = 20 }

gapses :: l a -> ModifiedLayout Gaps.Gaps l a
gapses = Gaps.gaps [(U, u gs), (R, x gs), (L, x gs), (D, d gs)]

spacingses :: l a -> ModifiedLayout Spacing.Spacing l a
spacingses = Spacing.spacingRaw True
                                (Spacing.Border 0 (x' gs) (x' gs) (x' gs))
                                True
                                (Spacing.Border (x' gs) (x' gs) (x' gs) (x' gs))
                                True

full = Named.named "Fullscreen" $ Borders.noBorders (Fullscreen.fullscreenFull Layout.Full)
bsp = Named.named "Binary Partition" $ IfMax.IfMax 1 full $ gapses . spacingses $ BSP.emptyBSP
tall = Named.named "Tall" $ IfMax.IfMax 1 full $ gapses . spacingses $ ResizeTile.ResizableTall
  1
  (2 / 100)
  (1 / 2)
  []
tcm = Named.named "Three Columns" $ IfMax.IfMax 1 full $ gapses . spacingses $ ThreeCols.ThreeColMid
  1
  (1 / 10)
  (1 / 2)
tabs = Named.named "Tabbed" $ Tabbed.tabbedBottom DwmStyle.shrinkText tabTheme

layoutHook = layoutPlugins availableLayouts

-- Layout plugins that apply to all layouts
layoutPlugins
  = ManageDocks.avoidStruts
    . Borders.smartBorders
    . MultiToggle.mkToggle (MultiToggle.single MultiToggleInstances.FULL)

-- Available layouts
availableLayouts =
  bsp ||| tall ||| tcm ||| tabs

tabTheme = def
  { Tabbed.activeColor = base00
  , Tabbed.activeBorderColor = base00
  , Tabbed.activeTextColor = base06
  , Tabbed.inactiveColor = basebg
  , Tabbed.inactiveBorderColor = basebg
  , Tabbed.inactiveTextColor = base03
  , Tabbed.urgentColor = basebg
  , Tabbed.urgentBorderColor = basebg
  , Tabbed.urgentTextColor = base12
  , Tabbed.fontName = monospace
  , Tabbed.decoHeight = 52
  }
