import qualified XMonad as XMonad
import qualified WindowManager as WindowManager
import qualified XMonad.Layout.IndependentScreens as IndependentScreens
    
main :: IO ()
main = do
    screenId <- IndependentScreens.countScreens
    WindowManager.start screenId myModMask 
    myModMask = XMonad.mod1Mask
