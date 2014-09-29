import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

import Padding

import qualified Data.Map as M

main = xmonad $ defaultConfig
	{ focusedBorderColor = "#90A959"
	, normalBorderColor = "#151515"
	, borderWidth = 4
	, layoutHook = avoidStruts $ myLayoutHook
	, keys = myKeys <+> keys desktopConfig
	}

myLayoutHook = centered ||| tiled ||| full
    where
        centered = padding 0 175 $ Full

        tiled = Tall nmaster delta ratio

        full = spacing 0 $ noBorders Full

        -- The default number of windows in the master pane
        nmaster = 1

        -- Default proportion of screen occupied by master pane
        ratio = 5/8

        -- Percent of screen to increment by when resizing panes
        delta = 5/100

myKeys (XConfig {modMask = modm}) = M.fromList $
	[ ((modm,               xK_p     ), spawn "dmenu_run")
    , ((modm .|. shiftMask, xK_h     ), spawn "thunar /home/brian/")
	, ((modm .|. shiftMask, xK_Return), spawn "urxvt")
	, ((modm .|. shiftMask, xK_v     ), spawn "/home/brian/bin/gvimTss")
	]

