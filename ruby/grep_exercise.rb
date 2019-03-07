phrase = ARGV[0]
puts "please enter phrase and file as command line arguments. file.txt is default filename. " if phrase == nil
phrase = "n/a" if phrase == nil
filename = ARGV[1]
filename = "file.txt" if filename == nil
matches = []
puts "phrase: #{phrase}, filename: #{filename}"
puts "\n"
file = File.open(filename, "r").each do |line|
    if line.include? phrase
        puts line
    end
end


