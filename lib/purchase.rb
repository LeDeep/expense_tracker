require './lib/money'

class Purchase < ActiveRecord::Base
  belongs_to :category

  validates :item, :presence => true
  validates :cost, :presence => true
  validates :date, :presence => true
  validates :category_id, :presence => true
  # composed_of :cost, :class_name => "Money", :mapping => %w(cost price)

  # after_initialize :change_cost
  
  def cost
    @cost ||= Money.new(0)
  end

  def cost=(cost)
    self[:price] = cost.price
  end
  



end

