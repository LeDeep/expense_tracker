require 'active_record'
require 'rspec'
# require 'factory_girl'
# require './spec/factories'
require 'purchase'
require 'category'
require 'shoulda-matchers'


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Purchase.all.each {|task| task.destroy}
  end
end