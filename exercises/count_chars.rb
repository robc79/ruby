# Count number of chars in a string supplied from stdin.

ins = nil
until !ins.nil? && ins.size > 0
  print "What is the input string? "
  ins = gets().chomp()
end
print "#{ins} has #{ins.size} characters."
