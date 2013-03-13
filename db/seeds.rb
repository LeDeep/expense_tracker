require './lib/category'
require './lib/purchase'

%w(utility food rent/mortgage taxes discretionary random car school).each do |tag|
  Category.create(:tags => tag)  
end

(1..6).each do |number|
  Purchase.create(:item => "item#{number}", :cost => ("#{number}#{number}.#{number}#{number}").to_f , :date => "#{number}/08/1985", :category_id => number)
end

