Random_Game := Object clone

Random_Game rand1to100 := method(
    x := Date second
    x = x**3
    x = x%100
    x = x roundDown
    x = x + 1
    return x
)
    
Random_Game start := method(
    stdio := File standardInput();
    rand_num := Random_Game rand1to100
    guesses_left := 10
    guess := 101
    while(rand_num != guess and guesses_left > 0,
            guess := stdio readLine("Guess a number between 1 and 100:   ") asNumber()
            if(rand_num == guess, 
                "You Won!" println 
                break
            )
        
        "Try again" println
        guesses_left = guesses_left - 1
    )
    "Game Over! The number was " print 
    rand_num println
)

Random_Game start