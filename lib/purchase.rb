class Purchase < ActiveRecord::Base
  belongs_to :category

  validates :item, :presence => true
  validates :cost, :presence => true
  validates :cost, :numericality => { :only_integer => true }
  validates :date, :presence => true
  validates :category_id, :presence => true


  







end
