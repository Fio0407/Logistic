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
  total = 0
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

def weighted_average(initial_stock,new_cost,new_quantity)
  c = 0
  initial_stock.each do |stocks|
    a = stocks[:unit_cost] * stocks[:quantity]
    b = new_cost * new_quantity
    c = (a + b) / (new_quantity + stocks[:quantity])
  end
  return c
end

def add_products(initial_stock)

  puts ' '
  puts '=' * 16
  puts '| Add Products |'
  puts '=' * 16
  puts ' '

  print 'Insert new type product: '
  new_type = gets.chomp.upcase
  puts ' '

  if new_type =~ /^[A-Z]$/
    print 'Insert new quantity: '
    new_quantity = gets.chomp.to_i.abs
    puts ' '

    if new_quantity != ~ /^[A-Z]$/
      print 'Insert unity cost: '
      new_cost = gets.chomp.to_i.abs

      if new_cost != ~ /^[A-Z]$/
        initial_stock.each do |stocks|
          if stocks[:type] == new_type
            if stocks[:unit_cost] != new_cost
              stocks[:unit_cost] = weighted_average(initial_stock,new_cost,new_quantity)
              break

            else
              stocks[:quantity] += new_quantity
              puts ' '
              puts 'Successful aggregate'
              break
            end
          else
            if stocks[:unit_cost] != new_cost
              new_product = {}
              new_product[:type] = new_type
              new_product[:quantity] = new_quantity
              new_product[:unit_cost] = new_cost
              initial_stock << new_product
              puts ' '
              puts 'The product was added successfully! '
              break
            end
          end
        end
      else
        puts 'Numbers, please!'
      end
    else
      puts 'Numbers, please!'
    end
  else
    puts 'Only letters, please!'
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

  if retire_type =~ /^[A-Z]$/
    puts 'Enter the quantity to withdraw: '
    retire_quantity = gets.chomp.to_i.abs
    puts ' '
    if retire_quantity != ~ /^[A-Z]$/
      initial_stock.each do |stocks|
        if stocks[:type] == retire_type
          if retire_quantity < stocks[:quantity]
            stocks[:quantity] -= retire_quantity
            puts ' '
            puts 'Successful withdrawal!'
          else
            print 'The request exceeds the current stock!'
          end
        end
      end
    else
      puts 'Numbers, please!'
    end
  else
    puts 'Only letters, please!'
  end
end

def show_movements(initial_stock)

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
  when 3
    retire_products(initial_stock)
  when 4
    show_movements(initial_stock)
  else
    puts 'wrong option, try again'
  end

  puts ' '
  menu
  choice = gets.chomp.to_i
end
