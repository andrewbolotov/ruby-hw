inputArray = ARGV
if inputArray[0] == inputArray[2] and inputArray[1] == inputArray[3]
	puts "Точка найдена!"
elsif inputArray[0] == inputArray[2]
	puts "х координата верна, y нет" 
elsif inputArray[1] == inputArray[3]
	puts "y координата верна, x нет" 
else 
	puts "Близко, но нет"
end