class Group < ActiveRecord::Base
  belongs_to :purchases
  belongs_to :categories

  validates :category_id, :presence => true
  validates :purchase_id, :presence => true














end
