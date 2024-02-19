import Data.Char (isDigit)

-- USES GUARD
getDigits :: String -> String
getDigits string
    | not (isDigit (head string))  = getDigits (tail string)
    | not (isDigit (last string)) = getDigits (init string)
    | otherwise = [head string]

-- USES LET-IN + RECURSION
elfHelper :: String -> Int
elfHelper "" = 0 
elfHelper input =
    let (line:rest) = lines input
    in read (getDigits line ++ getDigits (reverse line)) + elfHelper (unlines rest)

main :: IO ()
main = do
    contents <- readFile "src/day_01/input.txt"
    print (elfHelper contents)

    --solution: 55971, first try :D