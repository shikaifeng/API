$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"


RSpec.describe "Thrift::Api::V1::Test" do
        # add_user_buyer methed test
        describe "add_shipping_addresses methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "浙江省", "receiver_city" => "杭州市", "receiver_district" => "西湖区", "receiver_address" => "Dong Bu Ruan Jian Yuan", "receiver_zip" => "310000", "receiver_mobile" => "18658808996"}

            end
            #1.vaild add shipping address sucess,return address_id and created time  --incomplete
            it "when user add address sucess,return address_id and created time" do
                #puts @obj["shipping_address_add_response"]["shipping_address"].count.should ==2
            end
            #2.vaild the user has up to 10 shipping address,return error
            it "when user has more then 10 shipping address ,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "浙江省", "receiver_city" => "杭州市", "receiver_district" => "西湖区", "receiver_address" => "Dong Bu Ruan Jian Yuan", "receiver_zip" => "310000", "receiver_mobile" => "18658808996"}
                @data = @t.taobao_top.add_shipping_addresses(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 15
                @obj["error_response"]["sub_msg"].should eq "收货地址已经满（最多10个），不能继续添加"
            end 
        # unexception Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #3.vaild receiver_state parameter error
            it "when receiver_state not exsise,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "zhe jiang", "receiver_city" => "杭州市", "receiver_district" => "西湖区", "receiver_address" => "Dong Bu Ruan Jian Yuan", "receiver_zip" => "310000", "receiver_mobile" => "18658808996"}
                @data = @t.taobao_top.add_shipping_addresses(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 15
                @obj["error_response"]["sub_msg"].should eq "省份不存在：zhe jiang"
            end 
            #4.vaild receiver_city parameter error
            it "when receiver_city not exsise,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "浙江省", "receiver_city" => "hang zhou", "receiver_district" => "西湖区", "receiver_address" => "Dong Bu Ruan Jian Yuan", "receiver_zip" => "310000", "receiver_mobile" => "18658808996"}
                @data = @t.taobao_top.add_shipping_addresses(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 15
                @obj["error_response"]["sub_msg"].should eq "城市不存在：hang zhou"
            end
            #5.vaild receiver_district parameter error
            it "when receiver_district not exsise,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "浙江省", "receiver_city" => "杭州市", "receiver_district" => "xi hu", "receiver_address" => "Dong Bu Ruan Jian Yuan", "receiver_zip" => "310000", "receiver_mobile" => "18658808996"}
                @data = @t.taobao_top.add_shipping_addresses(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 15
                puts @obj["error_response"]["sub_msg"].should eq "区/县不存在：xi hu"
            end 
            #6.vaild receiver_address parameter error
            it "when receiver_address not exsise,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "浙江省", "receiver_city" => "杭州市", "receiver_district" => "西湖区", "receiver_address" => "", "receiver_zip" => "310000", "receiver_mobile" => "18658808996"}
                @data = @t.taobao_top.add_shipping_addresses(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 40
                @obj["error_response"]["msg"].should eq "Missing required arguments:receiver_address"
            end 
            #7.vaild receiver_address parameter error
            it "when receiver_zip not exsise,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "浙江省", "receiver_city" => "杭州市", "receiver_district" => "西湖区", "receiver_address" => "Dong Bu Ruan Jian Yuan", "receiver_zip" => "", "receiver_mobile" => "18658808996"}
                @data = @t.taobao_top.add_shipping_addresses(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 40
                @obj["error_response"]["msg"].should eq "Missing required arguments:receiver_zip"
            end 
            #8.vaild receiver_zip parameter error
            it "when receiver_zip not exsise,return error" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opts={"receiver_name" => "xxx", "receiver_state" => "浙江省", "receiver_city" => "杭州市", "receiver_district" => "西湖区", "receiver_address" => "Dong Bu Ruan Jian Yuan", "receiver_zip" => "310000", "receiver_mobile" => ""}
                @data = @t.taobao_top.add_shipping_addresses(session,opts)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"].should eq 15
                @obj["error_response"]["sub_msg"].should eq "必须至少提供receiver_phone和receiver_mobile中的一个"
            end 
          end   
       end
    end
end