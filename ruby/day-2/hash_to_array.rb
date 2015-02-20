hash = {:foo => 1, :bar => 2}

# i.e. [[:foo, 1], [:bar, 2]]
array = hash.map{|k,v| [k,v]}

hash2 = array.inject({}) {|h,a| h.merge(a[0]=>a[1])}

puts hash
puts hash2
