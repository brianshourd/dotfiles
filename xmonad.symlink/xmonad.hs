import Data.Ratio
import XMonad
import XMonad.Actions.FloatKeys
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

import Padding

import qualified Data.Map as M

main = xmonad $ ewmh defaultConfig
	{ modMask = mod4Mask
    , focusedBorderColor = "#90A959"
	, normalBorderColor = "#151515"
	, borderWidth = 4
	, layoutHook = avoidStruts $ myLayoutHook
	, keys = myKeys <+> keys desktopConfig
	}

myLayoutHook = centered ||| htiled ||| vtiled ||| full
    where
        centered = padding 0 175 $ Full

        htiled = Tall nmaster delta ratio
        vtiled = Mirror $ Tall nmaster delta ratio

        full = spacing 0 $ noBorders Full

        -- The default number of windows in the master pane
        nmaster = 1

        -- Default proportion of screen occupied by master pane
        ratio = 5/8

        -- Percent of screen to increment by when resizing panes
        delta = 5/100

myKeys (XConfig {modMask = modm}) = M.fromList $
	[ ((modm,               xK_p     ), spawn "dmenu_run")
	, ((modm .|. shiftMask, xK_Return), spawn "urxvt")
    , ((modm,               xK_d     ), withFocused (keysResizeWindow (-20,0) (1%2,0)))
    , ((modm,               xK_s     ), withFocused (keysResizeWindow (20,0)  (1%2,0)))
    , ((modm .|. shiftMask, xK_d     ), withFocused (keysResizeWindow (0,-20) (0,1%2)))
    , ((modm .|. shiftMask, xK_s     ), withFocused (keysResizeWindow (0,20)  (0,1%2)))
	]

