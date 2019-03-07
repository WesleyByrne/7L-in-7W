array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
#i = 0
#j = 3
#while i < 16 
#    print array[i..j]
#    puts ''
#    i += 4
#    j += 4
#end

array.each {
    |x| print x, ' '
    puts '' if (x % 4) == 0
}

puts "\n"

array.each_slice(4) {
    |x| print x, ' '
    puts ''
}