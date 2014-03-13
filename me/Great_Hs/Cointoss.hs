import Control.Monad
import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = 
    let (firstCoin, newGen)   = random gen
        (secndCoin, newGen')  = random newGen
        (thirdCoin, newGen'') = random newGen'
    in  (firstCoin, secndCoin, thirdCoin)

{--
 -p.200
 -like...
 threeCoins (mkStdGen 21)
--}
