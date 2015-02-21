fib := method(k,
  if (k <= 1,
    k,
    fib(k-1) + fib(k-2)
  )
)

for (i, 1, 10,
  "fib(#{i}) = #{fib(i)}" interpolate println
)
