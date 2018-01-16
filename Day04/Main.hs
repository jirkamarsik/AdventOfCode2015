module Main where

import qualified Data.ByteString.Lazy.Char8 as C
import Data.Digest.Pure.MD5 (md5)

md5Hash :: String -> String
md5Hash = show . md5 . C.pack

isAdventCoin :: String -> Integer -> Bool
-- isAdventCoin secretKey i = replicate 5 '0' == take 5 (md5Hash (secretKey ++ show i))
isAdventCoin secretKey i = replicate 6 '0' == take 6 (md5Hash (secretKey ++ show i))

main :: IO ()
main = do input <- getContents
          let secretKey = head $ lines input
              adventCoins = filter (isAdventCoin secretKey) [1..]
          print $ head adventCoins
