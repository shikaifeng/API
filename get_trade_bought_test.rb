$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"


RSpec.describe "Thrift::Api::V1::Test" do
        # add_user_buyer methed test
        describe "get_itemcats methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"fields" => "seller_nick, buyer_nick, title, type, created, sid, tid, seller_rate, buyer_rate, can_rate, status, payment, discount_fee"}
                @data = @t.taobao_top.get_trade_bought(session, opts)
                @obj= JSON.parse(@data)
                puts @obj
            end 
            #1.valid itemcats values
            it "valid the values of the itemcats returned right" do
                puts @obj

            end
        end
    end
end