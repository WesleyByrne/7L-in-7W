/* Write a Censor trait with a method that will replace the curse 
words Shoot and Darn with Pucky and Beans alternatives. use a map
to store the curse words and their alternatives.

Load the curse words and alternatives from a file */

class Censor {
    var badwords = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
    //var badwords:Map[String, String] = ();
    //file must be simple format: key and value seperated by whitespace, repeating
    def defineBads(file_name:String) {
        badwords = badwords -- badwords.keySet
        val input_str = scala.io.Source.fromFile(file_name).mkString
        val input_arr = input_str.split(" ")
        for  (x <- (0 to input_arr.size-1 by 2)) {
            println (input_arr(x)+"->"+input_arr(x+1))
            badwords = badwords + (input_arr(x) -> input_arr(x+1))
        }
    }

    def censorIt(file_name:String) {
        val input_str = scala.io.Source.fromFile(file_name).mkString
        /* 
            '\n' seems to cause strange behaviour with Scala
            without additional spaces added to the output it seems 
            to overwrite the line above it with whitespace.
            I also had to add whitespace at the end of the middle lines
            in the input file because 'badwords.contains' would not yield true 
            on words preceding an '\n'
        */
        val input_arr = input_str.split("\n")
        var output_str = " "
        input_arr.foreach{ line =>
            //
            line.split(" ").foreach{ str => 
                if (badwords.contains(str)) output_str += badwords(str)
                else output_str += str
                output_str += " "
                //if (output_str.size < 50) println(output_str)
            }
            output_str += "\n "
        }
        print(output_str)
    }
    
    //unused
    /*private def containsBadWord(word:String):Boolean = {
        badwords.keysIterator.foreach{ word_ =>
            if(word == word_) true
        }
        false
    }*/
}

val censor = new Censor
censor.defineBads("test_files/badwords")
censor.censorIt("test_files/fresh_prince")