# Retirement calculator.

age = 0

until age > 0
  print "What is your current age? "
  raw_age = gets.chomp
  age = raw_age.to_i
end

retire_age = 0

until retire_age >= age
  print "At what age would you like to retire? "
  raw_retire_age = gets.chomp
  retire_age = raw_retire_age.to_i
end

current_year = Time.new.year
years_to_retire = retire_age - age
retire_year = current_year + years_to_retire

puts "You have #{years_to_retire} years left until you can retire."
puts "It's #{current_year}, so you can retire in #{retire_year}."
