import Data.List
import Data.Map ((!))
import qualified Data.Map as M

-- represents a permutation in a cycle notation
cycleForm :: [Int] -> [[Int]]
cycleForm p = unfoldr getCycle $ M.fromList $ zip [0..] p
  where
    getCycle p
      | M.null p = Nothing
      | otherwise =
          let Just ((x,y), m) = M.minViewWithKey p
              c = if x == y then [] else takeWhile (/= x) (iterate (m !) y)
          in Just (c ++ [x], foldr M.delete m c)

-- the set of Lyndon words generated by inverse Burrows—Wheeler transform
lyndonWords :: Ord a => [a] -> Int -> [[a]]
lyndonWords s n = map (ref !!) <$> cycleForm perm
  where
    ref = concat $ replicate (length s ^ (n - 1)) s
    perm = s >>= (`elemIndices` ref)

-- returns the de Bruijn sequence of order n for an alphabeth s
deBruijn :: Ord a => [a] -> Int -> [a]
deBruijn s n = let lw = concat $ lyndonWords n s
               in lw ++ take (n-1) lw