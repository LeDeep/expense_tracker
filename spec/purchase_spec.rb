require 'spec_helper'

describe Purchase do 
  context 'validations' do 
    it {should validate_presence_of :item}
    #it {should_not allow_value('123123').for :item}
    #it {should allow_value('10 glasses').for :item}
    it {should validate_presence_of :cost}
    it {should allow_value(10.25).for :cost}
    it {should allow_value(10).for :cost}
    it {should validate_presence_of :date}
    it {should validate_presence_of :category_id}
    
  end

  context 'associations' do 
    it {should belong_to :category}

  end

  context 'date-scopes' do 
    let(:dates) {['1/1/2001', '2/2/2002']}

    it 'returns all dates that are after the set beginning date' do 
      purchases = dates.map {|date| FactoryGirl.create(:purchase, :date => date)}
      Purchase.beginning_date("04/04/2001").first.date.to_s.should eq '2002-02-02'
    end

    it 'returns all dates that are before the set ending date' do 
      purchases = dates.map {|date| FactoryGirl.create(:purchase, :date => date)}
      Purchase.ending_date("04/04/2001").first.date.to_s.should eq '2001-01-01'
    end
  end


  # context 'cost' do 
  #   it 'should be an instance of money' do 
  #     purchase = Purchase.create(:item => "item", :cost => Money.new(213.54), :date => "10/08/1985", :category_id => 1)
  #     purchase.cost.should be_an_instance_of Money
  #   end
  # end




end