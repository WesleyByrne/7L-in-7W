// "Use foldLeft to compute the total size of a list of strings"

// numstrings: 6, totalsize: 20
val listostrings = List("this", "is", "a", "list", "of", "strings") 

listostrings.length
println("total size of list of strings: " + listostrings.foldLeft(0)((sum, value) => sum + value.size))