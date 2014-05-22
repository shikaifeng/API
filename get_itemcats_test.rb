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
                opts={"cids" => "50011740"}
                @data = @t.taobao_top.get_itemcats(opts)
                @obj= JSON.parse(@data)
                #puts @obj
            end 
            #1.valid itemcats values
            it "valid the values of the itemcats returned right" do
                puts @obj["itemcats_get_response"]["item_cats"]["item_cat"][0]["cid"].should eq 50011740
                puts @obj["itemcats_get_response"]["item_cats"]["item_cat"][0]["is_parent"].should eq true
                puts @obj["itemcats_get_response"]["item_cats"]["item_cat"][0]["name"].should eq "流行男鞋"
                puts @obj["itemcats_get_response"]["item_cats"]["item_cat"][0]["parent_cid"].should eq 0
            end
         # unexception Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end 
            #2.valid cid not excise
            it "when cid not excise,return none" do
                opts={"cids" => "111"}
                @data = @t.taobao_top.get_itemcats(opts)
                @obj= JSON.parse(@data)
                puts @obj["itemcats_get_response"].count.should == 0
            end
            #3.valid cid is none
            it "when cid not excise,returned error_response" do
                opts={"cids" => ""}
                @data = @t.taobao_top.get_itemcats(opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 41    
                @obj["error_response"]["msg"].should eq "Invalid arguments:cids" 
            end
        end
    end
end
end
