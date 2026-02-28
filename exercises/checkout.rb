# Self checkout simulation.
require 'bigdecimal'

TAX_RATE = 1.055

def prompt_price(idx)
  price = BigDecimal(0)
  
  until price > 0
    print "Enter the price of item #{idx}: "
    raw_price = gets.chomp
    begin
      price = BigDecimal(raw_price)
    rescue ArgumentError
      price = 0
    end
  end

  price
end

def prompt_quantity(idx)
  qty = 0

  until qty > 0
    print "Enter the quantity of item #{idx}: "
    raw_qty = gets.chomp
    qty = raw_qty.to_i
  end

  qty
end

prices = []
quantities = []

3.times do |idx|
  shifted_idx = idx + 1
  prices << prompt_price(shifted_idx)
  quantities << prompt_quantity(shifted_idx)
end

subtotal = BigDecimal(0)

3.times do |idx|
  subtotal += prices[idx] * quantities[idx]
end

total = subtotal * TAX_RATE
tax = total - subtotal

puts "Subtotal: £#{subtotal.to_s('F')}"
puts "Tax: £#{tax.to_s('F')}"
puts "Total: £#{total.to_s('F')}"
