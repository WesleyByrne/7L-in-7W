List myAverage := method(
    sum := 0
    vals := self size
    self foreach(v, 
        if (v type != "Number", Exception raise("Not a valid number"))
        sum = sum + v
    ) 
    sum = sum / vals
    return sum
)
"The average of the numbers 2,3,4,5,6 is:" println
list(2,3,4,5,6) myAverage println

"\nThis will be an error: list(2,4,\"red fish\", \"blue fish\")" println
list(2,4,"red fish", "blue fish") myAverage println