// Io is strongly typed
(1 + 1) println
e := try (
  (1 + "one") print // argument type error
)
(e error) println

// what values a truthy?
(0 == true) println // false
("" == true) println // false
(nil == true) println // false

// print the slots a prototype supports
MyProtoType := Object clone
MyType := MyProtoType clone
MyType foo := "bar"
(MyType proto) slotNames println

// '=' updates an existing slot
car := Object clone
e := try (
  car fuelType = "diesel" // this will fail
)
(e error) println
car color := "red" // this will pass
car driver ::= "Fred"
car setDriver("Lucy")
"driver is #{car driver}" interpolate println

