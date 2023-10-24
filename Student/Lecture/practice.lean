-- file --> save as --> show local to download file


/- define constants -/
def m : Nat := 1

/- check their types (ctrl shift enter to run) -/
#check m

/- evaluate -/
#eval 5*4

/-
NOTES
-- use two dashes to do a single-line comment
def declares new constant symbols into the working env
a -> b denotes the type of functions from a to b
a × (\times) b denotes the Cartesian product 

Docker container is created with Ubuntu (has all the software needed for this class) --> connect VSCode to the Docker 
--> connect to repository on Github, not local machine?
Cloned forked repository into Docker container --> need to pull changes from repository into cloned repository

 Use Source Control / Git to control changes

 ***At top click three dots --> Terminal --> New Terminal --> type git pull upstream main

fetch: downloads changes into repository

Given and two types, let's call them α and β, we can form a new type, written α → β
Nat → Nat - increment / decrement, factorial
Nat → Nat → - modulo, addition, subtraction, exponentiation

add 3 4 --> returns function that adds three to its argument 
#check does not have a type - is a utility function

append Hello is an example of String -> String
(String → String) → String → String - ex. encryption
  (String -> String) - is how you want to encrypt
  String: String you want to encrpt
  String: Encrypted String

-/


def crazy (f : String → String) (a : String) : String := (f a) 
#eval crazy f1 s1

def crazy2 : (String → String) → String → String 
| f, a => (f a)

/- two ways of writing the same thing, second way is more intuitive -/

/- 
lean does pattern matching if you use true or false in a function (they're already of type Bool)
unbound variable (ex. f in crazy example), bound variable (ex. true in xor example)
-/

def same : (Nat → Nat)
| n => n

def same_bool : (Bool → Bool)
| true => true
| false => false

def another_bool (b:Bool) : Bool := b

def third_bool : (Bool → Bool)
| b => b

def polymorphic_id (T : Type) : T→T  -- don't understand this
| t, v => v

/- 
NOTES
imperative language - has a seuqence
functional language - body of a function is always a single expression that returns one result?
infinite number of types (because you can do String -> String, String, etc.)
need a type parameter
-/