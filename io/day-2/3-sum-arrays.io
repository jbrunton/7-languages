values := list(
  list(1, 2),
  list(3, 4)
)

flatSum := method(xs,
  sum := 0
  xs foreach(x,
    if (x type == "List",
      sum := sum + flatSum(x),
      sum := sum + x
    )
  )
)

flatSum(values) println

