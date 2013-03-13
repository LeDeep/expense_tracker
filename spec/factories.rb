FactoryGirl.define do 
  factory :purchase do 
    item 'sandwich'
    cost 7.33
    date '10/13/2005'
    association :category, :factory => :category
  end

  factory :category do 
    tags 'food'
  end 




end