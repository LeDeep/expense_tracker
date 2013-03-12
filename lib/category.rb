class Category < ActiveRecord::Base
  has_many :purchases

  validates :tags, :presence => true
  validates :tags, :inclusion => { :in => %w(utility food rent/mortgage taxes discretionary random car school) }




end



