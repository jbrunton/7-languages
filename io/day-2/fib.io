// recursion
fib := method(k,
  if (k <= 1,
    k,
    fib(k-1) + fib(k-2)
  )
)

for (i, 1, 10,
  "fib(#{i}) = #{fib(i)}" interpolate println
)

// loops
fib2 := method(k,
  a := 0
  b := 1
  t := 0
  while (k > 0,
    k := k - 1
    t := b
    b := a + b
    a := t
  )
  a
)

for (i, 1, 10,
  "fib2(#{i}) = #{fib2(i)}" interpolate println
)
