import XMonad
import XMonad.Actions.WindowGo
import XMonad.Util.EZConfig

main = do
     xmonad $ defaultConfig{
      terminal = myTerminal
     , modMask = myModMask
     , borderWidth = myBorderWidth
     , normalBorderColor = "#99ccff"
     , focusedBorderColor = "#0033dd"
     }


myTerminal      =       "konsole"
myModMask       =       mod4Mask
myBorderWidth   =       2


--for keyboard shortcut
-- modm = mod4Mask
-- let `additionalKeys`
-- [
-- ((modm,xK_e),spawn "emacs"),
-- ((modm,xK_t),spawn "konsoke"),
-- ((modm,xK_F4),kill)
-- ((modm,xK_f),spawn "chromium")
-- ]
