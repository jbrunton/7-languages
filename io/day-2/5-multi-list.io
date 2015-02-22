MultiList := Object clone

MultiList dim := method(x, y,
  self x := x
  self y := y

  self values := list setSize(x)
  for(i, 0, x-1,
    self values atPut(i, list setSize(y))
  )
)

MultiList set := method(x, y, val,
  self values at(x) atPut(y, val)
)

MultiList get := method(x, y,
  self values at(x) at(y)
)

MultiList transpose := method(
  matrix := MultiList clone
  matrix dim(self y, self x)
  for (i, 0, self y-1,
    for (j, 0, self x-1,
      matrix set(i, j, self get(j, i))
    )
  )
  return matrix
)

myList := MultiList clone
myList dim(2, 3)
myList set(1, 2, "foo")
myList get(1, 2) println

transpose := myList transpose
transpose get(2, 1) println
