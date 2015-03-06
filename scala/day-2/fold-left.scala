val totalSize = (0 /: List("some", "strings")) {
  (total, s) => total + s.length
}

println(totalSize)
