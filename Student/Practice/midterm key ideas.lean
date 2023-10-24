/-!
## Wrap-Up: Understand the Following

Understand the following types and their introduction 
and elimination operations. You should understand exactly
which introduction (constructor) and elimination operations
correspond to these types, and how to define the types and
these operations, and how to use them, without looking at
notes. 

- {α β : Type} → (a : α) → (b : β) → α × β  introduction operation for product type
- {α β : Type} → α × β → α elimination operation for product type
- {α β : Type} → α × β → β elimination operation for product type
- {α β : Type} → α → α ⊕ β introduction operation for sum type
- {α β : Type} → β → α ⊕ β introduction operation for sum type
- {α β γ : Type} → α ⊕ β → (α → γ) → (β → γ) → γ elimination operation for sum type
- {α β : Type} → (α → β) → α → β  introduction operation type for function type
- {α β : Type} → [procedure yielding some β given any α] → (α → β) introduction operation for function type
- (unit : Unit) introduction operation for unit
- There's no useful elimination operation for Unit
- There is no introduction operation for *Empty*
- { α : Type } → Empty → α elimination operation for empty
-/


def sum_comm { α β : Type} : α ⊕ β → β ⊕ α :=         --MEMORIZE
fun s => 
  match s with
  | Sum.inl a => Sum.inr a
  | Sum.inr b => Sum.inl b


def funkom: {α β γ : Type} → (β → γ) → (α → β) → (α → γ)  --MEMORIZE
| α, _, _, b2y, a2b => fun (a:α) => (b2y (a2b a))

def glue_funs : {α β γ : Type} → (β → γ) → (α→β) → α → γ   --MEMORIZE
| _,_,_,b2y,a2b,a => b2y (a2b (a))

-- × is right associative


inductive reward : Type                                   --MEMORIZE
| money
| health
--need to do open reward and #reduce instead of #eval 


-- Here we give new names to old function friends
def fun_double := fun (n : Nat) => 2 * n
def fun_square := fun (n : Nat) => n ^ 2 

-- Here we pass an unnamed function to composee
#eval compose (fun (n : Nat) => n%2 == 0) String.length "Love!"


















--product type
def product_construct {a b : Type} : a → b → a × b
| a, b => (a,b)

def product_elim {a b: Type} : a × b → a
| (a,b) => a

--sum type
def sum_construct {a b : Type} : a → a ⊕ b            --REVIEW
| a => Sum.inl a

def sum_elim {a b y: Type} : a ⊕ b → (a→y) → (b→y) → y    --REVIEW
| Sum.inl a, a2y, b2y => a2y a
| Sum.inr b, a2y, b2y => b2y b

--func type
def func_construct: Bool → Bool                      --REVIEW
| true => false
| false => true

#eval func_construct true

--unit type
def unit_construct: {a: Type} → Unit                  --REVIEW
| a => Unit.unit --can also rewrite as a=>()


--empty type
def empty_elim: {a: Type} → Empty → a                 --REVIEW
| _, e => nomatch e

