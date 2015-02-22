Builder := Object clone

Builder level := 0

Builder indent := method(
  "  " repeated(level)
)

Builder forward := method(
  writeln(indent, "<", call message name, ">")
  level = level + 1
  call message arguments foreach(arg, 
	  content := self doMessage(arg); 
	  if (content type == "Sequence", writeln(indent, content))
  )
  level = level - 1
  writeln(indent, "</", call message name, ">")
)

Builder ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))
