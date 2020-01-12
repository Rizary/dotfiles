module Workspaces where

import qualified XMonad as XMonad

-- Map from the keybinding to the workspace name.
workspaces :: [String]
workspaces =
  [ "\xf015" -- general
  , "\xf121" -- development mainly for Haskell
  , "\xf109" -- development mainly for Rust
  , "\xf02d" -- reading book
  , "\xf0ac" -- web browser
  , "\xf233" -- SRE
  , "\xf10a" -- mobile emulator
  , "\xf032" -- blogging space
  , "\xf074" -- random stuff
  , "\xf01c" -- unread email/inbox
  , "\xf03d" -- OBS
  , "\xf144" -- Kids stuff
  ]

myWorkspaces :: [String]
myWorkspaces = clickable workspaces
  where
      clickable l = [ "<action=xdotool key super+F" ++ show (n) ++ ">" ++ ws ++ "</action>"
                    | (i,ws) <- zip [1..12] l, let n = i
                    ]
