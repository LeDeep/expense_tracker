require 'active_record'
require './lib/category'
require './lib/purchase'



database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

def welcome
  puts "Welcome to the Epicodus Expense Tracker."
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' add a purchase and press 'r' to run purchase reports."
    choice = gets.chomp
    case choice
    when 'a'
      add_purchase
    when 'r'
      run_report
    when 'e'
      exit
    else
      invalid
    end
  end
end

def add_purchase
  puts "Please enter the item:"
  item = gets.chomp
  puts "Please enter the cost of the purchase:"
  cost = gets.chomp
  puts "Please enter the date of the purchase: Example (03/12/2013)"
  date = Date.parse(gets.chomp)
  puts "Please select the number associated with the category of your purchase:"
  Category.all.each_with_index {|category, i| puts (i + 1).to_s + ". " + category.tags}
  category = gets.chomp
  Purchase.create("item" => item, "cost" => cost, "date" => date, "category_id" => category )
end

def run_report
  puts "Please select the category number that whos report you would like to run:"
  Category.all.each_with_index {|category, i| puts (i + 1).to_s + ". " + category.tags}
  tag = Category.find(gets.chomp)
  display_purchase(tag.purchases)
end

def display_purchase(purchases)
  puts "Here are your purchases for the requested category:\n" 
  purchases.each do |purchase|

  puts "Item: #{purchase.item}"
  p purchase.cost
  puts "Date: #{purchase.date}" + "\n\n"
  end

end   


welcome