MultiList := Object clone

MultiList dim := method(x, y,
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

myList := MultiList clone
myList dim(2, 3)
myList set(1, 2, "foo")
myList get(1, 2) println
