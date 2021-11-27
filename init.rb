# frozen_string_literal: false

require_relative './products'

initial_stock = PRODUCTS.clone(freeze: false)

def menu
  puts 'What would you like to do?'
  puts "-- Type '1' to show stocks."
  puts "-- Type '2' to add new products."
  puts "-- Type '3' to retire products."
  puts "-- Type '4' to show movements of product."
  puts "-- Type '5' to exit."
  puts 'Type your choice: '
end

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

  puts 'Enter the type to withdraw: '
  retire_type = gets.chomp.upcase
  puts ' '
  puts 'Enter the quantity to withdraw: '
  retire_quantity = gets.chomp.to_i.abs
  puts ' '

  initial_stock.each do |stocks|
    if stocks[:type] == retire_type
      if retire_quantity < stocks[:quantity]
        stocks[:quantity] -= retire_quantity
        puts ' '
        puts 'Successful withdrawal'
      else
        print 'The request exceeds the current stock'
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
  new_type = gets.chomp.upcase

  new_product['type'] = new_type
  puts ' '
  print 'Insert new quantity: '
  new_quantity = gets.chomp.to_i.abs
  new_product['quantity'] = new_quantity

  puts ' '
  print 'Insert unity cost: '
  new_cost = gets.chomp.to_i.abs
  new_product['unit_cost'] = new_cost
  initial_stock << new_product

  puts ' '
  puts 'The product was added successfully! '


end

menu

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

  puts ' '
  menu
  choice = gets.chomp.to_i
end