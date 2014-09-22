import XMonad
import XMonad.Actions.WindowGo
import XMonad.Util.EZConfig --removekeys, additionalkeys
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks --spawnPipe, hPutStrLn

main = do
     myStatusBar <- spawnPipe "xmobar"
     xmonad $ defaultConfig{
      terminal = myTerminal
     , modMask = myModMask
     , borderWidth = myBorderWidth
     , normalBorderColor = "#99ccff"
     , focusedBorderColor = "#0033dd"
     , layoutHook = myLayoutHook
     , manageHook = myManageHook
     , logHook = myLogHook myStatusBar
     }

     -- `removeKeys` myOverriddenKeys
     -- `additionalKeys` myAdditionalKeys

myTerminal      =       "konsole"
myModMask       =       mod4Mask
myBorderWidth   =       2
myLayoutHook = avoidStruts $ layoutHook defaultConfig
myManageHook = manageDocks <+> manageHook defaultConfig

myLogHook h = dynamicLogWithPP xmobarPP {
ppOutput = hPutStrLn h
}

-- myFont = "monaco:size=6"


-- myAdditionalKeys = [
-- -- launch dmenu
-- -- ((myModMask,xK_p ), spawn ("dmenu_run -fn '" ++ myFont ++ "' -nf grey"))

-- -- Custom commands
-- , ((myModMask,xK_c ), spawn "firefox")
-- ]

-- -- myOverriddenKeys = [
-- -- (myModMask,xK_p )
-- -- ]


-- for keyboard shortcut
-- modm = mod4Mask
-- `additionalKeys`=
-- [
-- ((modm,xK_e),spawn "emacs"),
-- ((modm,xK_t),spawn "konsoke"),
-- ((modm,xK_F4),kill)
-- ((modm,xK_f),spawn "firefox")
-- ]
