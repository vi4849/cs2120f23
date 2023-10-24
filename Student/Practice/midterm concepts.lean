/-
GOOD PRACTICE PROBLEMS: HW 5, HW 6, PROBLEM 5 IN HW 3



Lectures
1) Data types + functions 
Arrows are right associative! (so #3 and #2 are equal) 
#check (String → String) → String   -- #1
#check String → (String → String)   -- #2
#check String → String → String     -- #3
Function application is left associate, and × is right associative

def xor : Bool -> Bool -> Bool --either Bool can be true to be true but not both
| true, true => false
| true, false => true
| false, true => true
| false, false => false

def nand : Bool -> Bool -> Bool --opposite of xor
| true, true => true
| true, false => false
| false, true => false
| false, false => true

def nor : Bool -> Bool -> Bool --not or
| true, true => true
| true, false => false
| false, true => false
| false, false => true






3 & 4) Generalization & Specialization

def id_poly : (α : Type) → α → α  
| α, v => v 

#check (id_poly)          -- generalized definition
#check (id_poly Nat)      -- specialization to Nat

Polymorphic code!
def id_poly' : {α : Type} → α → α   -- α is an implicit argument 
| _, v => v






5) Function Composition

Note: f(f a) is equal to (f ∘ f) a

def apply2 {α : Type} : (α → α) → α → α
| f, a => f (f a)

def compose {α β γ : Type} :
  (β → γ) → 
  (α → β) → 
  (α → γ)       
| g, f => (fun a => g (f a)) 
-- create a fun at the end since we're returning a function, not just one type






6) Data Types
Three main types: *enumerated* types, *product* types and *sum* types. 

An enumerated type has a (typically small) number of 
*constant* values. By constant we mean that the values 
of a type are produced by what we call *constructors* 
that *don't take any arguments*. (ex. Bool - has T and F)

Product type (x): and, Prod.fst / Prod.snd
Sum type (⊕): or, Sum.inl / Sum.inr

RPS / namespaces
Constructor / deliminators 







7) Sum, Unit, Empty Types
8) Unit and Empty Types
9) Empty Type
10) Recursive Types
11 & 12) Propositional Logic
13) Propositional Logic / Satisfiability



HW 4) Product types and sum types are both associative and commutative 
Product types are also distributive; α × (β ⊕ γ) → (α × β) ⊕ (α × γ) works 

HW 5) add and mul are also here 

def demorgan1  {α β : Type} : ((α → Empty) ⊕ (β → Empty)) → (α × β → Empty)  
| (Sum.inl noa) => (fun (a,b) => nomatch noa a)
| (Sum.inr nob) => (fun (a,b) => nomatch nob b)

def demorgan2 {α β : Type} : (α ⊕ β → Empty) → ((α → Empty) × (β → Empty))
| noaorb => (fun a => nomatch noaorb (Sum.inl a), fun b => nomatch noaorb (Sum.inr b))

def demorgan3 {α β : Type} : ((α → Empty) × (β → Empty)) → ((α ⊕ β) → Empty)  
| (a,b) => fun x => match x with 
  | Sum.inl e => nomatch a e
  | Sum.inr f => nomatch b f

HW 6)

def list_rev {α : Type} : List α → List α 
| [] => []
| x::t => concat (list_rev t) [x]

def apply_n {α : Type} : (α → α) → α → Nat → α  
| f, a, 0 => a
| f, a, (n' + 1) => apply_n f (f a) n'

def apply_n {α : Type} : (α → α) → α → Nat → α  
| f, a, 0 => a
| f, a, (n' + 1) => f (apply_n f a n')











SUMMARY

Types:
1) Empty
- No functions from inhabited types to Empty
- α → Empty implies that α is Empty 
- Nat × String → Empty (inhabited)
- Nat → Empty (uninhabited)
- Empty → Nat (uninhabited)

2) Unit
- one value; communicates no information
- useful for side effects (think void from Java)

3) Sum (a ⊕ b)
- commumative, associative, and distributive

4) Prod (a × b) -> × is right associative!
- commumative, associative, and distributive

5) Enumerated 
- small number of constant values (ex. Bool - has T/F)
- include inductive types
  - construct object using smaller types of that object (ex. Doll - shell/solid)
  - use this type for structural recursion (recursion that ends)

Propositions:
- Variable: a; Proposition: {a}
- var → Bool is an interpretation
- Use interpretations to evaluate expressions and return true / false values
- Expressions can be:
  - Unsatisfiable (all false)
  - Satisfiable (at least one true)
  - Valid / Tautology (all true)


-/