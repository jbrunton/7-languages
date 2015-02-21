Number divideBy := Number getSlot("/")
Number / := method(k,
  if (k == 0,
    0,
    self divideBy(k)
  )
)

"5 / 2 = #{5 / 2}" interpolate println
"2 / 0 = #{2 / 0}" interpolate println
