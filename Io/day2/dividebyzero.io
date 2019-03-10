
#must set a new copy of the division method in order to retain normal division behavior
Number setSlot("div", Number getSlot("/"))
#return zero if denominator is zero
Number / := method (a, if(a==0, 0, div(a)))

(22/7) println
#output: 3.1428571428571428

(4/0) println
#output: 0