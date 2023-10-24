/-!
# Homework #3

Near final DRAFT. 

The purpose of this homework is to strengthen your
understanding of function composition and of enumerated
and product data types. 
-/

/-!
## Problem #1

Define a function of the following polymorphic type:
{α β γ : Type} → (β → γ) → (α → β) → (α → γ). Call it
*funkom*. After the implicit type arguments it should
take two function arguments and return a function as
a result. 
-/

-- Answer below
def funkom {α β γ : Type} : (β → γ) → (α → β) → (α → γ)
| g, f => (fun a => g (f a))
-- NOTE: fun (a:α) <-- assigns alpha to a, can use _ to help you understand what you need to do 

/-! 
## Problem #2

Define a function of the following polymorphic type:
{α β : Type} → (a : α) → (b : β) → α × β. Call it mkop.
-/

-- Answer below
def mkop {α β : Type} : (a : α) → (b : β) → α × β
| c, d => Prod.mk c d


/-! 
## Problem #3

Define a function of the following polymorphic type:
{α β : Type} → α × β → α. Call it op_left.
-/

-- Answer below
def op_left {α β : Type} : α × β → α
| a => Prod.fst a



/-! 
## Problem #4

Define a function of the following polymorphic type:
{α β : Type} → α × β → β. Call it op_right.
-/

-- Answer below
def op_right {α β : Type} : α × β → β
| a => Prod.snd a
--alternative solution: | α, β, p => match p with | (a,b) => b
--NOTE: when type alpha beta is on the right of the colon, it stays only for that line. if it's on the left, it stays for the entire func

/-! #5
## Problem #5

Define a data type called *Day*, the values of which
are the names of the seven days of the week: *sunday,
monday, etc. 

Some days are work days and some days are play
days. Define a data type, *kind*, with two values,
*work* and *play*.

Now define a function, *day2kind*, that takes a *day*
as an argument and returns the *kind* of day it is as
a result. Specify *day2kind* so that weekdays (monday
through friday) are *work* days and weekend days are
*play* days.

Next, define a data type, *reward*, with two values,
*money* and *health*.

Now define a function, *kind2reward*, from *kind* to 
*reward* where *reward work* is *money* and *reward play* 
is *health*.

Finally, use your *funkom* function to produce a new
function that takes a day and returns the corresponding
reward. Call it *day2reward*.

Include test cases using #reduce to show that the reward
from each weekday is *money* and the reward from a weekend
day is *health*.
-/

namespace problem5

inductive Day: Type 
| monday
| tuesday
| wednesday
| thursday 
| friday 
| saturday
| sunday

open Day

inductive kind: Type
| work 
| play

open kind

def day2kind: Day → kind
| monday => work
| tuesday => work
| wednesday => work
| thursday => work
| friday => work
| saturday => play
| sunday => play

inductive reward: Type
| money
| health

open reward

def kind2reward: kind → reward
| work => money
| play => health

def day2reward: Day → reward
| a => funkom kind2reward day2kind a


#reduce day2reward monday      -- expect money
#reduce day2reward tuesday     -- expect money
#reduce day2reward wednesday   -- expect money
#reduce day2reward thursday    -- expect money
#reduce day2reward friday      -- expect money
#reduce day2reward saturday    -- expect health
#reduce day2reward sunday      -- expect health

end problem5

/-!
Problem #6

Consider the outputs of the following #check commands. 
-/

#check Nat × Nat × Nat
#check Nat × (Nat × Nat)
#check (Nat × Nat) × Nat


/-!
Is × left associative or right associative?

Answer here: right associative

Define a function, *triple*, of the following type:
{ α β γ : Type } → α → β → γ → (α × β × γ)  
-/

-- Here:
def triple { α β γ : Type } : α → β → γ → (α × β × γ)  
| a, b, c => Prod.mk a (Prod.mk b c)


/-!
Define three functions, call them *first*, *second*, 
and *third*, each of which takes any such triple as
an argument and that returns, respectively, it first,
second, and third elements.
-/

-- Here:
def first {α β γ : Type} : α × β × γ → α   
| a => a.1

def second {α β γ : Type} : α × β × γ → β   
| a => (a.snd).fst 
-- NOTE: cleaner way: | (_, b, _) => b

def third {α β γ : Type} : α × β × γ → γ   
| a => a.snd.2

/-!
Write three test cases using #eval to show that when 
you apply each of these "elimination" functions to a
triple (that you can make up) it returns the correct
element of that triple.  
-/

-- Here:
#eval first (triple "hello" 5 true )   --expect "hello"
#eval second (triple "hello" 5 true )  --expect 5
#eval third (triple "hello" 5 true )   --expect true


/-!
Use #check to check the type of a term (that you can
make up) of type (Nat × String) × Bool. 
-/

/-
FAILED ATTEMPTS
#check (triple 5 "hello") true
#check triple 5 ("hello" true)
#check triple (5 "hello" true)
#check triple (5 "hello") true
#check triple (5 "hello") true
-/

#check ((5, "hello"),  true)




