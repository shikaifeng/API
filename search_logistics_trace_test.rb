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
                opts={"tid" => "634636837810109", "seller_nick" => "日兴和数码专营"}
                @data = @t.taobao_top.search_logistics_trace(session, opts)
                @obj= JSON.parse(@data)
                #puts @obj
            end 
            #1.valid Logistics information
            it "valid the values of the itemcats returned right" do
                @obj["logistics_trace_search_response"].count.should == 5
                @obj["logistics_trace_search_response"]["trace_list"]["transit_step_info"].count.should == 16
                @obj["logistics_trace_search_response"]["company_name"].should eq "韵达快递"
                @obj["logistics_trace_search_response"]["out_sid"].should eq "1700102243449"
                @obj["logistics_trace_search_response"]["status"].should eq "对方已签收"
                @obj["logistics_trace_search_response"]["tid"].should eq 634636837810109
            end
        end
         # unexpection test   
        describe "unexpection test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #2.session is blank,return the vaules of tid
            it "when session is blank,still return the vaules of tid" do
                session = ""
                opts={"tid" => "634636837810109", "seller_nick" => "日兴和数码专营"}
                @data = @t.taobao_top.search_logistics_trace(session,opts)
                @obj= JSON.parse(@data)
                @obj["logistics_trace_search_response"].count.should == 5
                @obj["logistics_trace_search_response"]["trace_list"]["transit_step_info"].count.should == 16
            end
            #3.session is error,return the vaules of tid
            it "when session is error,still return the vaules of tid" do
                session = "123131ddddd23"
                opts={"tid" => "634636837810109", "seller_nick" => "日兴和数码专营"}
                @data = @t.taobao_top.search_logistics_trace(session,opts)
                @obj= JSON.parse(@data)
                @obj["logistics_trace_search_response"].count.should == 5
                @obj["logistics_trace_search_response"]["trace_list"]["transit_step_info"].count.should == 16
            end
            #4.tid not excised,return none
            it "when tid not excised,return none" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"tid" => "xxx1231231xxx", "seller_nick" => "日兴和数码专营"}
                @data = @t.taobao_top.search_logistics_trace(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 41
                @obj["error_response"]["msg"].should eq "Invalid arguments:tid"
            end
            #5.tid is blank,return none
            it "when tid is blank,return none" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"tid" => "", "seller_nick" => "日兴和数码专营"}
                @data = @t.taobao_top.search_logistics_trace(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 40
                @obj["error_response"]["msg"].should eq "Missing required arguments:tid"
            end
            #6.seller_nick is error,return none
            it "when seller_nick is blank,return none" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"tid" => "634636837810109", "seller_nick" => "日兴"}
                @data = @t.taobao_top.search_logistics_trace(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 15
                @obj["error_response"]["msg"].should eq "Remote service error"
            end
            #7.seller_nick is error,return none
            it "when seller_nick is blank,return none" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"tid" => "634636837810109", "seller_nick" => ""}
                @data = @t.taobao_top.search_logistics_trace(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 40
                @obj["error_response"]["msg"].should eq "Missing required arguments:seller_nick"
            end
       end
    end
end