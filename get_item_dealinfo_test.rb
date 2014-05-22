$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"


RSpec.describe "Thrift::Api::V1::Test" do
        # 免费获取商品月销量与评价总数
        # get_item_dealinfo methed test
        describe "get_itemcats methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                session = ""
                opts={"fields" => "sales_count,rates_count", "num_iid" => "37936142868"}
                @data = @t.taobao_top.get_item_dealinfo(session, opts)
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