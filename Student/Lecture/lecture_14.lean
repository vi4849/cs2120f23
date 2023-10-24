--midterm review notes

--recursion practice 
def fact : Nat → Nat
| 0 => 1 --need a base case
| n'+1 => (n'+1) * fact n' --and a recursive case

def list_len {α : Type} : List α → Nat
| [] => 0
| x::t => 1 + list_len t

def empty : List Bool := List.nil 
-- need to define the type of a list before you can use it 
-- lean can't infer the type of an empty list

#eval list_len [3,2,1,0]
#eval list_len empty

def sum_cubes : List Nat → Nat
| [] => 0
| x::t => (x*x*x) + sum_cubes t --can rewrite x*x*x as x^3


--apply an operator between different elements in a list
def reduce_or : List Bool → Bool
| [] => false
| h::t => or h (reduce_or t)

def reduce_and : List Bool → Bool
| [] => true
| h::t => and h (reduce_and t)

--every proposition in an empty set is true

def is_even : Nat → Bool
| 0 => true --this is evaluated before 1 => false
| 1 => false
| Nat.succ (Nat.succ n') => is_even n'

--use or for satisfiable, and for unsatisfiable / valid 

--added some things in lecture13 file

--check to see if a function is uninhabited by plugging it into a function that takes a function and returns empty




