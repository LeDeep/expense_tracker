require 'spec_helper'

describe Group do 
  context 'validations' do 
    it {should validate_presence_of :category_id}
    it {should validate_presence_of :purchase_id}
  end

  context 'assocations' do 
    it {should belong_to :purchases}
    it {should belong_to :categories}
  end
 
end