values := list(
  list(1, 2),
  list(3, 4)
)

flatSum := method(xs,
  xs flatten reduce(+)
)

flatSum(values) println
