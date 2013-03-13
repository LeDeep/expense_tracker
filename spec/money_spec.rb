require 'spec_helper'

describe Money do 

  context 'initialize' do 
    it 'should initialize with a money argument' do
      money = Money.new(1.78)
      money.should be_an_instance_of Money
    end
  end

  context 'readers' do 
    it 'shows the instance variable price' do 
      cost = 7.5
      money = Money.new(cost)
      money.price.should eq 7.5
    end
  end

end