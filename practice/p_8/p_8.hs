
compress :: (Eq a) => [a] -> [a]
compress = foldr (appendIfDiff) []
    where appendIfDiff:: [a] -> a -> [a]
          appendIfDiff acc x =    if last acc ==  x
                                  then acc
                                  else acc ++ [x]


main = print $ compress "aaaabccaadeeee"