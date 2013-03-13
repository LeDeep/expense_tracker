FactoryGirl.define do 
  factory :purchase do 
    item 'sandwich'
    cost 7.33
    date '10/13/2005'
  end

  factory :category do 
    tags 'food'
  end 

  factory :purchase_with_category do 
    category_id 4
    purchase_id 2
  end




end