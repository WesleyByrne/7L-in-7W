/*Write a game that will take a tic-tac-toe board 
with X, O and blank characters and detect the winner
or whether there is a tie or no winner yet. 
Use classes where appropriate*/

import scala.io.Source

class Tictactoe_Tester {
    private var board:Array[Char] = new Array[Char](9)
    
    //this function takes a valid board file (without checking) 
    //and determines the winner of the game
    def testBoard(file_name:String) {
        var i:Integer = 0
        Source.fromFile(file_name).foreach {
            source =>
            print(source)
            if (source != ' ' && source != '\n' && source != '\r'){
                board(i) = source
                i = i + 1
            }
        } 
        revealWinner()
    }

    private def revealWinner() {
        var result:Char = testWinner()
        if (result == 'z') println("\nNo Winner!")
        else println("\n" + result + " Wins!")
    }

    private def testWinner():Char = {
        //brute force winner testing
        //test rows
        if(board(0) == board(1) && board(0) == board(2)) board(0)
        else if(board(3) == board(4) && board(3) == board(5)) board(3)
        else if(board(6) == board(7) && board(6) == board(8)) board(6)
        //test columns
        else if(board(0) == board(3) && board(0) == board(6)) board(0)
        else if(board(1) == board(4) && board(1) == board(7)) board(1)
        else if(board(2) == board(5) && board(2) == board(8)) board(2)
        //test diagonals
        else if(board(0) == board(4) && board(0) == board(8)) board(0)
        else if(board(3) == board(4) && board(3) == board(6)) board(3)
        else 'z'


    }
}

val tester = new Tictactoe_Tester

//error testing not implemented, assumes valid tic-tac-toe board format
tester.testBoard("test_files/xwin ")
tester.testBoard("test_files/owin")
tester.testBoard("test_files/xwin_diag")
tester.testBoard("test_files/no_win")