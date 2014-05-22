$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"


RSpec.describe "Thrift::Api::V1::Test" do
        # 收费物流流转信息查询
        # search_logistics_trace methed test
        describe "get_itemcats methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                out_id = SecureRandom.uuid.gsub('-', '')
                opts={"num_iids" => "21960704090", "out_id" => out_id, "sku_iids" => "28494987323", "item_promotions" => "", "nums" => "2", "address_id" => "736605931", "shipping_type" => "express"}
                @data = @t.taobao_top.create_trade(session, opts)
                @obj= JSON.parse(@data)
                #puts @obj
            end
            #1.vaild return values
            it "vaild create trade sucess" do
                #puts @obj["trade_create_response"]["order_result"].count.should == 4
                #puts @obj["trade_create_response"]["order_result"]["total_fee"].should eq 5200.00
            end
            #2.vaild return values
            it "when  user buy it more then 20, not permite" do
                puts @obj["error_response"]["code"] == 15
                puts @obj["error_response"]["sub_msg"].should eq "购买数量超过了限购数"
            end
        end
         # unexpection test   
          describe "#unexpection test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #3.num_iids is none ,return error
            it "when num_iids is none  returned error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                out_id = SecureRandom.uuid.gsub('-', '')
                opts={"num_iids" => "", "out_id" => out_id, "sku_iids" => "28494987323", "item_promotions" => "", "nums" => "2", "address_id" => "736605931", "shipping_type" => "express"}
                @data = @t.taobao_top.create_trade(session, opts)
                @obj= JSON.parse(@data)
                puts @obj
                puts @obj["error_response"]["code"] == 40
                puts @obj["error_response"]["msg"].should eq "Missing required arguments:num_iids"
            end
            #4.sku_iids is none ,return error
            it "when sku_iids is none  returned error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                out_id = SecureRandom.uuid.gsub('-', '')
                opts={"num_iids" => "21960704090", "out_id" => out_id, "sku_iids" => "", "item_promotions" => "", "nums" => "2", "address_id" => "736605931", "shipping_type" => "express"}
                @data = @t.taobao_top.create_trade(session, opts)
                @obj= JSON.parse(@data)
                puts @obj
                puts @obj["error_response"]["code"] == 15
                puts @obj["error_response"]["sub_msg"].should eq "商品需要指定一个 SKU"
            end
            #5.nums is none ,return error
            it "when nums is none  returned error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                out_id = SecureRandom.uuid.gsub('-', '')
                opts={"num_iids" => "21960704090", "out_id" => out_id, "sku_iids" => "28494987323", "item_promotions" => "", "nums" => "", "address_id" => "736605931", "shipping_type" => "express"}
                @data = @t.taobao_top.create_trade(session, opts)
                @obj= JSON.parse(@data)
                puts @obj
                puts @obj["error_response"]["code"] == 40
                puts @obj["error_response"]["msg"].should eq "Missing required arguments:nums"
            end
            #6.address_id is none ,return error
            it "when address_id is none  returned error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                out_id = SecureRandom.uuid.gsub('-', '')
                opts={"num_iids" => "21960704090", "out_id" => out_id, "sku_iids" => "28494987323", "item_promotions" => "", "nums" => "2", "address_id" => "", "shipping_type" => "express"}
                @data = @t.taobao_top.create_trade(session, opts)
                @obj= JSON.parse(@data)
                puts @obj
                puts @obj["error_response"]["code"] == 15
                puts @obj["error_response"]["sub_msg"].should eq "区域码错误区域码不能为空"
            end
        end
    end
end