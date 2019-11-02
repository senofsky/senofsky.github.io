The other day I came across an interesting graphic that describes the different skill levels of a functional programmer.
According to the graphic, that Ladder of Functional Programming is a standardized progression of different concepts and skills that
developers must master on their  journel to becoeme expert level functional programmers. Whether or not this is true is debatable at best,
many people criticized this graphic as being non realistic. However the ladder does pick intersting topics and puts them in relatively increasing order of complexity,
so I thought it would be fun to do a series on reviewing the concepts and skills for each level. I didn't want to do a deep dive since topics are easily found
with a quick google search, but I'll review the material with a bit of personal input.

This is part 2 of the series, so I will be covering the "Advanced Beginner" portion of the graphic.

Algebraic Data Types

Pattern Matching

Parametric Polymorphism

General Recursion

Type Classes, Instances, and Laws

Lower-Order Abstractions (Equal, Semigroup, Monoid, etc.)

Referential Transparency and Totality
In a functional programming context, referential transparency is the concept that an expression can be replaced by its value without changing the result of the program. This implies that a function will ALWAYS return the same value for a given argument. The benefit of this is having easy-to-test functions, which lead to improved code quality, and predictable behavior. If a program is not referntially transparent, it is said to have "side effects". 

Higher-Order Functions

Partial-Application, Currying, and Point-Free Style
