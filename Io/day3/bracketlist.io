squareBrackets := method(
    ls := list()
    ls removeAll
    call message arguments foreach(arg, ls append(arg))
    return ls
)
 
test := [10,9,8,7,6,5,4,3,2,1,0]
 
test println 