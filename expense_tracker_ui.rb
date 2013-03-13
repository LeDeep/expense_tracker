require 'active_record'
require './lib/category'
require './lib/purchase'
require './lib/group'




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
    puts "Press 'a' add a purchase press 'c' to run reports by category, 'd' to run reports for a specific period."
    choice = gets.chomp
    case choice
    when 'a'
      add_purchase
    when 'c'
      run_category_report
    when 'd'
      run_period_report
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
  puts "Please enter the cost of the purchase: Example 26.79"
  cost = gets.chomp
  puts "Please enter the date of the purchase: Example (03/12/2013)"
  date = Date.parse(gets.chomp) 
  puts "Please select the number associated with the category of your purchase:\n\n"
  Category.all.each_with_index {|category, i| puts (i + 1).to_s + ". " + category.tags}
  category = gets.chomp
  if purchase = Purchase.create("item" => item, "cost" => cost, "date" => date)
    puts "#{item} has been added to your contacts.\n\n"
    add_group(group_purchase_id(purchase.id), group_category_id(category))
  else
    puts "Invalid item. Here's what's wrong:"
    contact.errors.full_messages.each {|message| puts "   #{message}."}
    puts "\nPlease enter again.\n\n"
    add_name
  end

end

def run_category_report
  puts "Please select the category number that whos report you would like to run:"
  Category.all.each_with_index {|category, i| puts (i + 1).to_s + ". " + category.tags}
  choice = gets.chomp
  tag = Category.find(choice)
  display_purchase(tag.purchases)
  print "Total expenditure for category: " 
  print Money.new(Purchase.sum(:cost, :conditions => {:category_id => choice}))
  print "\n\n"
end

def group_category_id(id)
  # Category.all.each_with_index {|category, i| puts (i + 1).to_s + ". " + category.tags}
  # choice = gets.chomp
  category = Category.find(id)
  category.id
end

def group_purchase_id(id)
  # Purchase.all.each_with_index {|purchase, i| puts (i + 1).to_s + ". " + purchase.items}
  # choice = gets.chomp
  purchase = Purchase.find(id)
  purchase.id
end

def add_group(purchase_id, category_id)
  Group.create(:purchase_id => purchase_id, :category_id => category_id)
end


def run_period_report
  puts "Enter the beginning date for the period you want to view? Example: (06/11/2012)"
  beginning_date = Date.parse(gets.chomp)
  puts "Enter the end date for the period you want to view? Example: (06/18/2012)"
  ending_date = Date.parse(gets.chomp)
  # period = Purchase.where(:date => (beginning_date..ending_date))
  period = Purchase.beginning_date(beginning_date).ending_date(ending_date)
  display_purchase(period)
  print "Total expenditure for period: "
  print Money.new(Purchase.sum(:cost, :conditions => {:date => (beginning_date..ending_date)}))
  print "\n\n"
end

def display_purchase(purchases)
  puts "Here are your purchases for the requested category:\n" 
  purchases.each do |purchase|

  puts "Item: #{purchase.item}"
  puts "Cost: #{Money.new(purchase.cost)}"
  puts "Date: #{purchase.date}\n\n"
  end
end

  


welcome
