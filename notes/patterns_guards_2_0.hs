{-
  - Pattern matching consists of specifying and checking if data
    conforms to a certain pattern, the deconstructing the data
    based on the pattern
  - Here lucky checks to see if the passed data is == 7 and if its
    not it will check to see if it can be expressed as x, which will
    catch everything else.
  - patterns are checked from top to bottom and run the corresponding function
    body when the correct match is made
  - Note that when pattern matching, you should always include a catch-all at the
    end so the program dosnt crash if no pattern is matched, remember what is happening
    here. lucky is a function with one parameter whose function body is an expression that
    must return something so if there is no catchall pattern and an unknown pattern is given, 
    then the function cannot return anything, which is an error because all expressions must
    return something. This is not caught at compile time so the programmer must be careful
  - the wildcard '_' character is often used as a catch-all or when we dont care about what the
    value actually is
-}
lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky _ = "Sorry, you're out of luck, pal!"

{-
  - a very common pattern matching pattern is to match with something like
    x:xs. this can be read like "x prepended to xs" like a plural x, xs
    so x will match and bind to the head of a list and xs will match the rest of the list
  - remember that [1,2,3] is syntactic sugar for 1:2:3:[], this is the pattern it uses to
    match
  - note : will only match for lists longer than 1
  - if you wanted to bind to the first 3 elements in a list and then the rest of the list
    you could do something like this, which will only match lists of size 3 or greater: 
      x:y:z:zs
-}

{-
  - in the list chapter i introduced the head function, which returns the head of a list, the
    first element
  - lets implement the same head function using pattern matching
  - first we check if the list is empty, and if not then we bind the first element to
    the variable x and we dont care about the rest of the list in this case so we
    use the wildcard 
  - Note: whenever you want to bind to multiple variables, you must wrap it in
    paranthesis
  - Also Note: error will throw a runtime exception and crash the program 
-}
head' :: [a] -> a
head' [] = error "Cant call head on empty list"
head' (x:_) = x

{-
  - lets also implement the list length function using pattern matching
  - first, we check to see if the list is empty, in which case the length is 0
  - next, we bind the variable xs to the tail of the list, i.e. everything but the head
    add 1 plus the result of the recursive call to length' on xs
-}
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

{-
  - another implementation of the list sum function
  - same deal so ill let you look at it and make sense
    of what it is doing
-}
sum' :: (Num a) => [a] -> b
sum' [] = 0
sum' (x:xs) = x + sum' xs

{-
  - Another feature of pattern matching which can match a pattern and bind to
    variables but also keep a refence to the whole thing
  - below is an example where we want to bind to variables based on a pattern
    but also keep the entire reference
  - to do this you use the {vaiable_name}@ syntax, this will bind the entire
    parameter to the variable "all"
  - here we still want the entire string but we also want to match a pattern
    and bind to variables
-}
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] 


{-
  - Guards
  - whereas patterns are good for testing if a value conforms to some
    form and deconstucting it, guards are good at testing if some property
    of a value is true or false
  - Guards are similar to a series of if statements, or a switch statement
    in java or C++ if the switch statement was able to test a predicate,
    which makes haskell more powerfull here
  - guards also work well with patterns 
  - use quards whenever you think the problem calls for a large if-else tree
-}

{-
  - Here is an example i got from the book which will always insult you
  - Some things to notice here:
  - after the function type definition, the parameter if first named bmi
  - next, a boolean expression is evaluated using the bmi variable
    if the boolean expression evaluates to True, then the cooresponding
    function body is executed. If the boolean expression evaluates to False,
    then the next boolean expression will be evaluated and so on, evaluation of
    a guard moves from top to bottom like pattern matching
  - like pattern matching, the programmer must be sure to that the guards span the
    input domain, which is just a rigorous mathamatical definition for those who took
    a bunch of math classes, but just make sure that every possible value that can be
    passed has a boolean expression that will evaluate to True
  - Here, this is accomplished with the otherwise boolean expression. otherwise is a function
    that takes no parameters, refered to as a definition, and returns True. This makes sure that
    the guard will never crash the program at runtime
  - This example is more like a traditional switch statement in that it just takes in a value
    and decides what to do based on the value
-}
bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  

{-
  - guards can also take parameters and do calulations before eveluating a boolean
    the importan thing to remember is that anything can be done in the boolean 
    expression part as long as at the end, something is evaluated to True or False
  - lets modify the bmi function to take a height and weight and calculate the bmi
    in the function instead of taking bmi as a parameter
  - bmi is calculated from the weight and heigh parameters and then it is evaluated
    to a boolean using the <= operator
  - this example extends the functionality of a traditional switch statement by allowing
    you to do calculations as part of the boolean expression
-}
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                 = "You're a whale, congratulations!"

{-
  - lets implement the max function, which takes 2 parameters and returns the larger one
  - Note that i use the Ord class contraint because in order to get a "larger" element
    they must be able to be ordered, Ord requires the implementation of comparison operators
    like >
  - ill leave you to read the function are really try and understand what it all means
-}
max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

