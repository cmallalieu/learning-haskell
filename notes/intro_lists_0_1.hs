{-
  - Lists are super important in haskell
  - lists are homogenous, in that a list can only 
    store objects of the same data type
  - Strings in haskell are actually lists of type [char]
    this means that any list function can also be called
    on a string. I will always use the word list to stay in
    the most general form but it all applies to strings too
-}

{-
  - ill go through a few list functions but there are many and
    i encourage you to check out the haskell docs at:
      https://hackage.haskell.org/package/base-4.15.0.0/docs/Data-List.html
  - the following are all expressions so i encourage you to write them into
    ghci and see what they evaluate to
-}

{-
  - to concatenate two lists use the ++ operator
  - Note: this operation is O(n) where n is the length of the list
    on the left hand side of the ++ operator
-} 
[1,2,3] ++ [4,5,6]
"hello" ++ " " ++ "world"
['s', 't', 'r'] ++ ['i', 'n', 'g']

{-
  - To add a single element to a list use the con operator ':'
  - This is done in constant time so no worries here
  - The last example illustrates that the syntax [1,2,3] is
    actually just syntactic suger for 1:2:3:[]. Here, 3 is prepended
    to the empty list [], then 2 is prepended to [3], and finally 1 is
    prepended to [2,3] to form the list [1,2,3]
-}
'A':" small cat"
0:[1,2,3,4]
1:2:3:[]

{-
  - the !! operator is used to return the an element of a list by index,
    zero indexed 
  - just be careful not to reference an index that does not exist
-}
[1,2,3,4] !! 1
"test" !! 0

{-
  - head takes a list as a paramenter and returns the head, the first element
  - tail takes a list and returns its tail, or the list without the head
  - last takes a list and returns the last element
  - init takes a list and returns the list without the last element
  - Note the programmer must take care to always ensure these functions
    are not called on an empty list as these errors cannot be caught at
    compile time
-}
head [0,1,2]
tail [0,1,2]
last [0,1,2]
init [0,1,2]

{-
  - length takes in a list and returns the number of elements in it
  - null takes in a list and returns a bool if the list is empty or not
  - reverse takes a list and returns a list with the elements reversed
  - take takes a number and a list and returns the first number of elements in a list
  - drop takes a number and a list and returns the list with the first number elements removed
  - maximum takes a listc of elements that can be put in some kind of order and returns the biggest
  - minimum is the same as maximum but returns the smallest
  - sum takes a list and returns the sum if the type of the elements can be added
  - product is the same as sum but multiplies all elements if possible
  - elem takes a thing and a list of the same type and returns a bool if that thing is contained
    in the list, most commonly used with infix notation
-}
length [0,1,2]
null [0,1,2]
reverse [0,1,2]
take 1 [0,1,2]
drop 1 [0,1,2]
maximum [0,1,2]
minimum [0,1,2]
sum [0,1,2]
product [0,1,2]
0 `elem` [0,1,2] 

{-
  - A cool thing with lists in haskell is the range functionality
  - ranges can be created for anything that is enumerable
  - ranges can be used to define an arithmetic series with step notation.
    you are only allowed to show one step in the range
  - since haskell is lazy, ranges can also create infinite lists
  - Warning: do not use ranges with floating point numbers because they are
    inprecises and you get some weird results
  - you should be doing this but plug these expressions into ghci and see what
    you get, feel free to experiment too
-}

[1..5]
[2,4..20]
[20, 18..0]
[1..]
['a'..'z']
['A'..'z']

{-
  - why use infinite lists?
  - Since haskell is lazy, it will only generate as much list
    as you actually ask for
  - for example here are two ways to get the first 24 multiples of 13
  - in the second example we create an infinite list of multiples of 13 but since
    we only ask for 24 for them, the computer will stop calulating multiples after 24
-}
[13,26..24*13]
take 24 [13,26..]

{-
  - list comprehensions: a lot like list comprehensions in python just
    different syntax
  - If you took a bunch of math classes, these are called set comprehensions
  - this can get pretty complex but its not haskell specific so for the purposes of this
    ill just show you the haskell syntax and move on
  - the first example returns a list that contains numbers that are double the numbers 1 thru
    10. i.e. [2,4,6,8,10,12,14,16,18,20], but you would know that because you are evaluating all
    these expressions in ghci yourself :)
  - the second example adds a predicate which is any expression that evaluated to a bool, and only
    includes the elements if the predicate evaluates to true, this is also called filtering
  - Note you can use multiple lists by bunding them to different variables and multiple predicates
-}
[x*2 | x <- [1..10]]
[x*2 | x <- [1..10], x*2 >= 12]