# frozen_string_literal: false

require_relative './products'

initial_stock = PRODUCTS.clone(freeze: false)

def init(initial_stock)

  puts ' '
  puts '=' * 20
  puts '| Available Stocks |'
  puts '=' * 20
  puts ' '
  initial_stock.each do |stocks|
    puts ' '
    stocks.each do |key, value|
      puts "#{key} : #{value}"
    end
  end
end

def retire_products(initial_stock)

  puts ' '
  puts '=' * 19
  puts '| Retire Products |'
  puts '=' * 19
  puts ' '

  retire_product = {}
  puts 'Enter the type to withdraw: '
  retire_type = gets.chomp
  retire_product['type'] = retire_type
  puts ' '
  puts 'Enter the quantity to withdraw: '
  new_retire_quantity = gets.chomp.to_i
  retire_product['quantity'] = new_retire_quantity
  puts ' '

  initial_stock << retire_product

  initial_stock.each do  |i|
    if retire_type == initial_stock[i][:type]
      if new_retire_quantity < initial_stock[i][:quantity]
          initial_stock[i][:quantity] -= retire_product[:quantity]
          puts ' '
          puts 'Successful withdrawal'
        else
          print 'error, at this time it is impossible to perform the movement '
        end
      end
    end
  end


def add_products(initial_stock)

  puts ' '
  puts '=' * 16
  puts '| Add Products |'
  puts '=' * 16
  puts ' '

  new_product = {}
  print 'Insert new type product: '
  new_type = gets.chomp

  new_product['type'] = new_type
  puts ' '
  print 'Insert new quantity: '
  new_quantity = gets.chomp.to_i
  new_product['quantity'] = new_quantity

  puts ' '
  print 'Insert unity cost: '
  new_cost = gets.chomp.to_i
  new_product['unit_cost'] = new_cost
  initial_stock << new_product

  puts ' '
  puts 'The product was added successfully! '


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
    puts ' '
    init(initial_stock)
  when 2
    add_products(initial_stock)
    init(initial_stock)
  when 3
    retire_products(initial_stock)
  when 4
    puts 'move'
  else
    puts 'wrong option, try again'
  end
  choice = gets.chomp.to_i
end