
-- ghci is the haskell interactive mode, many of the expressions not in
-- comments can be run in it

{-
  - Haskell is a staticlly typed language, i.e. all types must be
    known at compile time
  - Variables in haskell are all immutable, for example once you
    write the expression x = 1, x will represent the value of 1 forever.
  - functions are pure in haskell, this means that they have no side effects
    and are thus deterministic, with the exception of IO operations but that
    is a special case for later. Pure functions allows a function to guarantee
    that if it is called twice with the same parameters, it will always return the 
    same result
  - Haskell has a very good system of type inference, which means
    that while everything is statically typed, the programmer does not
    always need to explicitly state what the type is 
  - Here, the compiler is able to infer that 5 and 6 are numbers and
    ensure they are defined as numbers at compile time 
-}
a = 5 + 6

{-
- everything is a function in haskell
- most functions in prelude that deal with numbers are infix
- in this example '+' is a function being called with 3 and 2 
  as parameters in infix form
-}
x = 3 + 2

{-
  - functions are called by writing the name of the function,
    followed by the parameters seperated by spaces.
  - functions are called using prefix notation
  - here the function "min" is being called with the 
    parameters 9 and 10. Obviously, this will return 9
  - note: min is included in the prelude so it does not
    need to be defined, prelude is analogous to a standard library
  - Function application or calling a function has the highest
    precedence of everything in haskell
-}
min 9 10

{-
  - If you would like to call a function in infix form,
    surround it with backticks; `func`
  - Note: this is usually done in cases where it improves readability
  - Here are two examples of calling the div function, which divides any two
    things that can be considered a number, more on that distinction later
  - The infix way is more readable in this case, but both calls to div are equivalent
-}
div 10 5
10 `div` 5

{-
  - Note: something that tripped me up coming from a life of imperative programming,
    so its worth mentioning again, parenthasis are not used for function invocation
  - For example, to mimic an imperative style call like foo(bar(3)), you would write
    foo (bar 3) in haskell, parenthasis here are used for precedence and 
    tell haskell to evaluate the expression within them before applying the result to the
    next step of the entire prefix expression
  - Note my use of the word expression in the previous bullet, more on that 
    important distinction in a moment
-}

-- Now lets define some functions
{-
  - doubleMe: takes a parameter 'x' and
    returns that parameter added to itself
  - Notice how i say a parameter 'x' and not a number x,
    i am attempting to explain a function definition in its
    most general form.
  - In the case of this specific function, 
    haskell will throw an error if doubleMe is passed an 'x' that
    is not something that can be considered a number, this is because
    the '+' in the function definition requires 2 parameters that can
    be considered numbers. 
  - I keep saying can be considered which seems
    excessive right now but it will make sense later so bear with me
  - from a more general perspective, what is happening here is actually
    a powerful feature of haskell similar to generics in imperative
    languages like java and C++
  - Since we did not explicitly define the type of 'x', this function will work
    correctly so long as it is passed something that can be considered a number.
  - you could pass it a floating point number, an int, a double, a double precision
    float or anything that is considered a number and it will work
  - The way that i read this to help me understand what it really means is:
    "the function doubleMe takes parameter x and is defined as x plus x"
  - Another thought that helped this to make sense to me is to look at it as
    a much more consise function definition than a more comfortable language like python.
    
    in python an equivalent function would look like this:

      def doubleMe(x):
        return x + x
    here python also takes advantage of generics, but this is fundamental feature of dynamically
    typed languages.

    in a language like java, the function would look something like this:

      public <T extends Number> doubleMe(T num) {
        return num + num;
      }
    Ouch thats a mess, i used generics to mimic the behavior
  
    Isnt it so much simpler in Haskell to write a function?
-}
doubleMe x = x + x

{- 
  - In the first version of the doubleUs function, it takes
    x and y as parameters, doubles them, and then adds the results
  - In the second version, it uses doubleMe to accomplish the same goal
  - This is a common pattern in haskell, making a basic function and combining
    it with other basic functions to create more complex ones. this is good
    because it avoids repition and if you needed to change the behavior of the
    basic function, the changes would automatically propogate to the more complex
    functions
-}
doubleUs x y = x*2 + y*2
doubleUs x y = doubleMe x + doubleMe y

{-
  - here i introduce an if-then-else stement in haskell
  - this is pretty similer to imperative languages so i wont
    bore you with an explanation. "then" is required here
  - the one important thing to note here is that in haskell,
    if statements are required to be accompanied by an else statement.
    this is because and if statement is an expression and 
    every expression must return something in haskell.
    so you must include a return value for all possible outcomes when the if 
    is evaluated. In python this would work:
      if not x > 100:
        doubleMe(x)
    this is because python is happy to evaluate the if statement and "do nothing"
    and move one if x < 100.
  - I also use the doubleMe function here to show good haskell form 
-}
doubleSmallNumber x = if x > 100
                        then x
                        else doubleMe x

{-
  - This is a good time to talk about what exactly an expression is in haskell
  - an expression is pretty much anything that returns a value
  - 5 is an expression in haskell, that returns the number 5.
    4 + 8 is an expression that returns the number 12
    x + y is an expression that returns the sum of x and y
  - since an else statement is required in an if statement,
    it always returns something, thus it is an expression
-}

{-
  - A note about functions in haskell while we are at it:
  - since functions are pure in haskell, the definition or body
    of a function is always an expression, because expressions
    always return something
  - The below is actually a function called chrisMallalieu that
    takes no parameters and returns "thats my name". often in
    haskell when there is a function that takes no parameters,
    it is said to be a definition. Since haskell is a language built
    to be reasoned with mathamatically, i think of a definition as being
    a function like pi=3.14. This is the definition of pi and will never change.
    essentially, pi is a function that takes no parameters and returns its definition, 3.14
    3.14 is an expression that returns the floating point number 3.14
  - Back to my example, chrisMallalieu is a function that takes no parameters and evaluates
    the expression "thats my name", which returns "thats my name" this is generally how
    all functions work
-}
chrisMallalieu = "thats my name"