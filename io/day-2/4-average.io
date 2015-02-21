List myAverage := method(
  self reduce(+) / self size
)

list(2, 3) myAverage println
list(2, "three") myAverage // raises an exception


