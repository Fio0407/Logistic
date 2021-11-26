# frozen_string_literal: false

require_relative './products'

initial_stock = PRODUCTS

def init(initial_stock)
  print initial_stock
end

def add_products(new_product, initial_stock)
  initial_stock[0][:quantity] += new_product[:quantity]
end

puts 'What would you like to do?'
puts "-- Type '1' to show stocks."
puts "-- Type '2' to add new products."
puts "-- Type '3' to retire products."
puts "-- Type '4' to show movements of product."
puts "-- Type '5' to exit."
puts 'Type your choice: '

choice = gets.chomp.to_i
while choice != 5
  case choice
  when 1
    init(initial_stock)
  when 2
    add_products(new_product, initial_stock)
  when 3
    puts 'b'
  when 4
    puts 'move'
  else
    puts 'wrong option, try again'
  end
  choice = gets.chomp.to_i
end
