{-
  - haskell is statically typed so the type of all expressions must
    be know at compile time
  - every expression has a type, which is the type of its return value
  - while haskell has type inference, you can explicity define types
    using the "::" operator, which is read as "has type"
  - functions also have type, which is determined by its parameters and
    return value
  - function type definitions are usually not required but considered best
    practice as a reader can often learn a lot about a function by its type
    and it can serve as documentation
  - there can be any number of parameters but the last type in the -> "list"
    is always the return value and everything else is parameters
  - removeNonUppercase takes a string as a parameter and returns a string
  - addThree takes in 3 integer parameters and returns an int
-}
removeNonUppercase :: String -> String
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]  

addThree :: Int -> Int -> Int -> Int
addThree x y z = x+y+z

{-
  - A few common types, note that types always start with a capital letter:
  - Int
  - Integer, same as Int but can represent arbitrarily large numbers, less effiecient
  - Float, single precision floating point number
  - Double, double precision floation point number
  - Bool, you know
  - Char, character type, literals written with single quotes, ex. 'c'
-}

{-
  - type variables are generics from other languages
  - functions that use type variables are called 
    polymorphic functions
  - type variables start with a lowercase letter
  - the head function takes a list of any type and returns an element of that type
  - the fst function, which returns the first element of a tuple, returns the same type
    as whatever the first element is. Note that a and b could be the same type, but we are
    only guaranteed that the first element in the tuple and the return type will be the same
-}
head :: [a] -> a
fst :: (a, b) -> a

{-
  - typeclasses are like interfaces in java
  - Every type that belongs to a typeclass supports and
    implements the behavior that the typeclass describes
  - typeclass constrains place constrains on type variables
    when you assume type variables have certain characteristics
  - This is why i kept saying before that something would work if
    its considered a number, because the function was written under
    an assumption that whatever was passed has certain characteristics
  - take a look at the type definition of the "==" equality operator.
    note that you can get the type of anything by typing :t {func} into ghci,
    in this case :t (==)
  - There is a new symbol here, =>, everything before it is a class constraint
  - This type can be read as "the equality function takes any two values that
    are of the same type and returns a Bool. The type of those two values must be
    a member of the Eq class"
  - the Eq typeclass contains all types that it makes sense to test equality between
    two values, all standard haskell types except for IO are part of this class
  - the elem function, whose type is below, mandates that a is part of the Eq typeclass
    because in order to check if a element is in a list, it iterates through the list
    using the == operator
-}
(==) :: (Eq a) => a -> a -> Bool
elem :: (Eq a) => a -> [a] -> Bool

{-
  - A few common typeclasses:
  - Eq, supports testing for equality, its members implement functions for 
    the ==  and /= operators
  - Ord, types that can have an ordering, its members implement functions 
    such as >, <, >=, <=. those in Ord typeclass must also be in Eq
  - Show, types that can be presented as strings
  - Read, takes a string and returns Read type, which is a type variable itself
    you can explicatly cast a Read type variable to a explicit type using :: notation
    There is an example below
  - Enum, types in this class can be sequentially ordered and enumerated thought, can
    be used with list ranges
  - Bounded, members have a upper and lower bound
  - Num, types that can act like numbers both real numbers and integral, ex you can 
    perform arithmatic on them
  - Integral, includes only whole numbers. Int and Integer types are in this typeclass
  - Floating, includes only floating point numbers. Float and Double types are in this typeclass
-}
read :: (Read a) => String -> a
read "5" :: Int