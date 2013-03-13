require './lib/money'

class Purchase < ActiveRecord::Base
  has_many :categories, :through => :groups
  has_many :groups

  validates :item, :presence => true
  validates :cost, :presence => true
  validates :date, :presence => true

  scope :beginning_date, lambda {|date| where('date >= ?', date )}
  scope :ending_date, lambda {|date| where('date <= ?', date )}

  # composed_of :cost, :class_name => "Money", :mapping => %w(cost price)

  # after_initialize :change_cost
  
  # def cost
  #   @cost ||= Money.new(0)
  # end

  # def cost=(cost)
  #   self[:price] = cost.price
  # end
  



end

