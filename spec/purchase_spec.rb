require 'spec_helper'

describe Purchase do 
  context 'validations' do 
    it {should validate_presence_of :item}
    #it {should_not allow_value('123123').for :item}
    #it {should allow_value('10 glasses').for :item}
    it {should validate_presence_of :cost}
    it { should validate_numericality_of(:cost).only_integer}
    it {should validate_presence_of :date}
    it {should validate_presence_of :category_id}
    


  end

  context 'associations' do 
    it {should belong_to :category}

  end









end