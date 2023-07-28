
---------- Excercise 2.5 ----------
type ChurchNumeral a = (a -> a) -> a -> a

toChurch :: Int -> ChurchNumeral a
toChurch n f x = foldr (.) id (replicate n f) x

fromChurch :: ChurchNumeral Int -> Int
fromChurch cn = cn (+1) 0

-- examples
zero :: ChurchNumeral a
zero _ x = x

one :: ChurchNumeral a
one f x = f x

two :: ChurchNumeral a
two f x = f (f x)
