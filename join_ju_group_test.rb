$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"

RSpec.describe "Thrift::Api::V1::Test" do
        # get_user_buyer methed test
        describe "join_ju_group methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"item_id" => "37786583979"}
                @data = @t.taobao_top.join_ju_group(session,opts)
                @obj= JSON.parse(@data)
            end
            #1.提交订单成功
            it "valid the return of vaules" do
                @obj["ju_group_join_response"]["result"]["result_code"].should eq "SUCCESS_APPLY"
            end
        end
         # unexception Test   
          describe "unexception Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #2.团购商品失效(item_id对应的商品失效了)
            it "when item_id is invalid,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"item_id" => "35443391108"}
                @data = @t.taobao_top.join_ju_group(session,opts)
                @obj= JSON.parse(@data)
                @obj["ju_group_join_response"]["result"]["result_code"].should eq "ITEM_OUT_OF_DATE"
            end
           #3.团购商品不存在(item_id为空)
            it "when item_id is invalid,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"item_id" => ""}
                @data = @t.taobao_top.join_ju_group(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should == 40
                @obj["error_response"]["msg"].should eq "Missing required arguments:item_id"
            end
            #4.团购商品不存在(item_id错误)
            it "when item_id is invalid,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"item_id" => "465456"}
                @data = @t.taobao_top.join_ju_group(session,opts)
                @obj= JSON.parse(@data)
                @obj["ju_group_join_response"]["result"]["result_code"].should == "ERROR"
                puts @obj["ju_group_join_response"]["result"]["message"].should eq "哎哟~系统出错了，再试试吧~"
            end
            #5.session为空
            it "when item_id is invalid,return error" do
                session = ""
                opts={"item_id" => "37786583979"}
                @data = @t.taobao_top.join_ju_group(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should == 27
                @obj["error_response"]["msg"].should eq "Invalid session:session-is-blank"
            end
            #6.session错误
            it "when item_id is invalid,return error" do
                session = "5645646464646"
                opts={"item_id" => "37786583979"}
                @data = @t.taobao_top.join_ju_group(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should == 27
                @obj["error_response"]["msg"].should eq "Invalid session"
            end
        end
    end
end