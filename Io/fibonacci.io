Fibonacci := Object clone
Fibonacci fib := method(input, 
    (input > 2) ifTrue(
        a := 1
        b := 1
        for(i,3,input,
            c := a+b
            a := b
            b := c
        )
        c println 
    ) ifFalse("1" println)
)

Fibonacci fib(1)
Fibonacci fib(4)
Fibonacci fib(8)