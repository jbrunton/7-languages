MultiList := Object clone

MultiList dim := method(x, y,
  self x := x
  self y := y

  self values := list setSize(y)
  for(i, 0, y-1,
    self values atPut(i, list setSize(x))
  )
)

MultiList set := method(x, y, val,
  self values at(y) atPut(x, val)
)

MultiList get := method(x, y,
  self values at(y) at(x)
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

MultiList write := method(filename,
  file := File with(filename) open write(serialized) close
)

MultiList read := method(filename,
  copy := doFile(filename)
  self dim(copy x, copy y)
  self values := copy values
)

myList := MultiList clone
myList dim(2, 3)
myList set(1, 2, "foo")
myList get(1, 2) println

transpose := myList transpose
transpose get(2, 1) println

myList write("out.txt")
myList set(1, 2, "bar")
myList get(1, 2) println

myList read("out.txt")
myList get(1, 2) println