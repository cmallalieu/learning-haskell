{-
  - If we look at the previous bmi function, presented before,
    you see that there is a lot repeated code, yuck. We
    do the calculation "weight / height ^ 2" multiple times.
    lets clean that up
  - This is where, where, clause can help. we want to allow the
    function to take weight and height as parameters but not repeat outselves
    in the code
  - the second version implements a where clause. We are able to calculate bmi, only
    once this way, saving time, and bind the result to a variable that is visable
    in the scope of the entire function
  - i think of a where clause as creating a new namespace that is scoped to be accessible
    only within the function. you can create any function within this namespace without
    colliding with any other namespaces 
-}
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                   = "You're a whale, congratulations!"  

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  

{-
  - another example because this is important:
  - this function takes a first and last name as parameters and returns
    their initials
  - this example shows that you can pattern match within a where clause
  - you could have done that pattern matching without the where clause here,
    and it probably would have been better, but just to show whats possible
  - take the time to look and this function and walk through it to understand
    what it is doing
-}
initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname

{-
  - let bidings let you bind to a variable anywhere and are expressions themselves
  - one difference between where and let is that let statements are hyper local,
    if a let binding is made within a guard, the other guards cannot see it
  - the form is let <bindings> in <expression>
  - let bindings are scoped to only be visiable to the expression in the "in" part
  - let bindings are done before the expression whereas where binding are done after
  - The main takaway with let bindings is that they themselves are expressions, so they
    can be crammed in anywhere where an expression is expected, unlike where clauses which
    are not expressions
  - below are several examples to illustrate their usage
-}
-- let bindings are just an expression so they can be used anywhere an expression is used
4 * (let a = 9 in a + 1) + 2

--  they can be used to intruduce functions in a local scope
[let square x = x * x in (square 5, square 3, square 2)]

-- if you want to inline a let with several bindings, seperate them with semicolons
(let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)

-- you can use let with pattern matching
(let (a,b,c) = (1,2,3) in a+b+c) * 100  

{-
  - many imperative languages like java or C++ have support for case statments
  - these are called case expressions in haskell
  - the expression part means they can be used anywhere an expression can be used
    and can be an arbitrary expression
  - these two examples of head do the same thing just with different syntax
  - the general form of case statements are as follows:
        case expression of pattern -> result  
                        pattern -> result  
                        pattern -> result  
                        ...  
-}
head' :: [a] -> a  
head' [] = error "No head for empty lists!"  
head' (x:_) = x  

head'' :: [a] -> a  
head'' xs = case xs of [] -> error "No head for empty lists!"  
                      (x:_) -> x  

describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                                [x] -> "a singleton list."   
                                                xs -> "a longer list."  