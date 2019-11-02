The other day I came across an interesting graphic that describes the different skill levels of a functional programmer.
According to the graphic, that Ladder of Functional Programming is a standardized progression of different concepts and skills that
developers must master on their  journel to becoeme expert level functional programmers. Whether or not this is true is debatable at best,
many people criticized this graphic as being non realistic. However the ladder does pick intersting topics and puts them in relatively increasing order of complexity,
so I thought it would be fun to do a series on reviewing the concepts and skills for each level. I didn't want to do a deep dive since topics are easily found
with a quick google search, but I'll review the material with a bit of personal input.

This is part 1 of the series, so I will be covering the "Novice" portion of the graphic.

Immutable Data
In general, immutable data is data that cannot be changed. Once the value of an object is set, the value of the object cannot be modified.
Variables in Python are mutable, so once you assign a value to a variable, you can keep reassigning it:
```
x = 42
x = 43
```

However, in Haskell, you can only assign a value to a variable once:
```
x = 42
```
If you attempt to modify the variable `x`, this will fail:
```
x = 42
x = 43

stack ghc test.hs
[1 of 1] Compiling Main             ( test.hs, test.o )

test.hs:2:1: error:
    Multiple declarations of ‘x’
    Declared at: test.hs:1:1
                 test.hs:2:1
  |
2 | x = 5
  | ^
```

This is because variables in Haskell are immutable.
There are several benefits of making data immutable. The code becomes easier to read because variables don't change values.
This makes the variables inherently thread-safe since a variable cannot be modified by various threads.
In languages like Rust and OCaml, variables are immutable by default and must me explicitly marked to be made mutable.
A negative of immutability is that it's more memory-inefficient that its mutable counterpart. If a data object does need to be modified, a new object is created in memory as opposed to having the specific field being modified.


Second-Order Functions
A second-order function is a function that takes another function as input or returns a function as its result. In general, a second-order function is categorized as a higher-order function. A function that is not a higher-order function is a first-order function and it does not take a function as input or return a function. These are the types of functions are people are familiar with. Some of the more common higher-order functions are `map` and `filter`. A common pattern in software is list transformations. You have some list or array construct, and a function is applied, for example in an imperative language such as python:
```
list = [ elements in list ] 
for element in list:
    operations
    ...
```
However in a functional language like Haskell, you can use the higher-order function map:
```
map operation list
```

This is reduces the for-loop structure into a one line expression. It also allows the programmer to think of the operation as a 
list transformation since the list is mapped to a new list via the operation.

Contructing and Destructuring
Destructuring is a technique for extracting data from objects or arrays while constructing is how to build those objects.


Function Composition
A function composition is a function composed of two or more functions. In math, this this is represented as f(x) and g(x), and the composition is f(g(x)) or f . g(x). From an information flow point of view, this is similar to a Unix pipeline.  


First-Class Functions & Lambdas
A language supports first-class functions if it allows functions to be passed as arguments to other functions, returned as values from other functions, and assigning functions to variables. This is closely related to higher-order functions and function composition, because a language must support first-class functions if it intends to support either of these concepts.

A lambda function is also known as an anonymous function. This is because they don't have to have a name. This is allows closures and currying to be developed. A named function can be used anywhere a lambda function is used, however, sometimes it's convenient to use a lambda function, especially when the function is small.
