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
                opts={"fields" => "seller_nick, buyer_nick, title, type, created", "tid" => "653362338620109"}
                @data = @t.taobao_top.get_trade_fullinfo(session, opts)
                @obj= JSON.parse(@data)
            end 
            #1.valid values
            it "valid the values of the trade fullinfo returned right" do
                @obj["trade_fullinfo_get_response"].count.should eq 1
                @obj["trade_fullinfo_get_response"]["trade"].count.should eq 5 
                @obj["trade_fullinfo_get_response"]["trade"]["buyer_nick"].should eq "kaifeng15"
                @obj["trade_fullinfo_get_response"]["trade"]["seller_nick"].should eq "周生生官方旗舰店"
                @obj["trade_fullinfo_get_response"]["trade"]["title"].should eq "周生生官方旗舰店"
                @obj["trade_fullinfo_get_response"]["trade"]["type"].should eq "fixed"
            end
        end
        # unexpection test   
        describe "unexpection test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #2.session is blank,return error
            it "when session is blank,return error" do
                session = ""
                opts={"fields" => "seller_nick, buyer_nick, title, type, created", "tid" => "653362338620109"}
                @data = @t.taobao_top.get_trade_fullinfo(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 27
                @obj["error_response"]["msg"].should eq "Invalid session:session-is-blank"
            end
            #3.session is error,return error
            it "when session is blank,return error" do
                session = "123123123123"
                opts={"fields" => "seller_nick, buyer_nick, title, type, created", "tid" => "653362338620109"}
                @data = @t.taobao_top.get_trade_fullinfo(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 27
                @obj["error_response"]["msg"].should eq "Invalid session"
            end
            #4.tid not excised,return none
            it "when tid not excised,return none" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"fields" => "seller_nick, buyer_nick, title, type, created", "tid" => ""}
                @data = @t.taobao_top.get_trade_fullinfo(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 40
                @obj["error_response"]["msg"].should eq "Missing required arguments:tid"
            end
            #5.tid not excised,return none
            it "when tid not excised,return none" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"fields" => "seller_nick, buyer_nick, title, type, created", "tid" => "65336"}
                @data = @t.taobao_top.get_trade_fullinfo(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 15
                @obj["error_response"]["sub_msg"].should eq "订单号不存在"
            end
        end
    end
end