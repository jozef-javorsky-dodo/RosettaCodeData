   pg ← PrimeGen@
(function block)

   PG¨ ↕20
⟨ 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 ⟩

   {p←↕0 ⋄ PG∘{  p∾↩𝕩}_w_(<⟜ 150) PG _w_(<⟜ 100)0 ⋄ p}
⟨ 101 103 107 109 113 127 131 137 139 149 ⟩

   {p←0  ⋄ PG∘{𝕤⋄p+↩1}_w_(<⟜8000) PG _w_(<⟜7700)0 ⋄ p}
30

   (PrimeGen@)⍟1e4 @  # Reset the count with a new generator
104729
