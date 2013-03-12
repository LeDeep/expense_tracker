require 'spec_helper'

describe Category do 
  context 'validations' do 
    it {should validate_presence_of :tags}
    it {should allow_value("food").for :tags}


  end

context 'associations' do 
    it {should have_many :purchases}

  end










end