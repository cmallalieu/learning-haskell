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

