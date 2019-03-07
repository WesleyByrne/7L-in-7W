TwoDList := Object clone

TwoDList array := list()
TwoDList dim := method(x,y,
    self array := list()
    for (i, 1, x,
        self i := list()
        for (j, 1, y,
            self getSlot("i") append(0))
        array append(self getSlot("i"))
    )
)
TwoDList set := method(x,y,value,
    self i := array at(x) 
    self i atPut(y, value)
)
TwoDList get := method(x,y,
    self i := array at(x) 
    return (self i at(y))
)
TwoDList printArr := method(
    array foreach(x, x println)
)

#assumes all values are numbers
TwoDList runningSum := method(
    x := 0
    y := 0
    array foreach(v,
    y = v sum 
    x = x + y
    )
     
)

thing := TwoDList clone

thing dim(4,5)
thing set(2,0,15)
thing set(1,4,3)
thing set(3,3,1)
thing set(0,2,4)

"\nThis is the two-d array: " println
thing printArr

"\nThe element in 2,0 (0-based) is " print 
thing get(2,0) print

"\nThe sum of the available elements is " print
thing runningSum print



#read and write code

TwoDList writeFile := method(filename, 
    f := File open(filename)
    f write( self serialized() )
    f close()
)

thing writeFile("twodobj")
"\n\nThis is the copy read from the file:" println
thing := doFile("twodobj")
thing printArr