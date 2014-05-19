$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"


RSpec.describe "Thrift::Api::V1::Test" do
        # get_user_buyer methed test
        describe "get_shipping_addresses methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opt ={"fields" => "address_id, receiver_name, phone, mobile, is_default, location.address, location.zip, location.city, location.district,location.state"}
                @data = @t.taobao_top.get_shipping_addresses(session,opt)
                @obj= JSON.parse(@data)
                #puts @obj
            end
            #1.valid the number of user's address.premise user has at least one adress.
            it "valid returned address count" do
                @obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"].count.should == 8

            end
            #2.valid key of the shipping_address.premise user has at least one adress.
            it "valid key of the shipping_address" do
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0].has_key?"address_id").to be true
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0].has_key?"is_default").to be true
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0].has_key?"location").to be true
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0].has_key?"mobile").to be true
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0].has_key?"phone").to be true
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0].has_key?"receiver_name").to be true
            end
             #3.valid key of the location.premise user has at least one adress.
            it "valid key of the shipping_address" do
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0]["location"].has_key?"address").to be true
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0]["location"].has_key?"city").to be true
                expect(@obj["shipping_addresses_get_respopremise user has at least one adress.nse"]["shipping_addresss"]["shipping_address"][0]["location"].has_key?"state").to be true
                expect(@obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"][0]["location"].has_key?"zip").to be true
            end
        end
         #unexpection test   
          describe "#unexpection test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #4.user didn't set any address ,the address return none
            it "user has none address returned 0" do
                session = "6101530d5b84f14dd237378f07f76de2a31a1b1697864b02102684958"
                opt ={"fields" => "address_id, receiver_name, phone, mobile, is_default, location.address, location.zip, location.city, location.district,location.state"}
                @data = @t.taobao_top.get_shipping_addresses(session,opt)
                @obj= JSON.parse(@data)
                puts @obj["shipping_addresses_get_response"].count.should == 0
            end
            #5.session is error no data returned
            it "when session is error,returned  error message" do
                session = "1233434354353"
                opt ={"fields" => "address_id, receiver_name, phone, mobile, is_default, location.address, location.zip, location.city, location.district,location.state"}
                @data = @t.taobao_top.get_shipping_addresses(session,opt)
                @obj= JSON.parse(@data)    
                @obj["error_response"]["code"] == 27
                @obj["error_response"]["msg"].should eq "Invalid session"
            end
            #6.session is blank no data returned
            it "when session is blank,returned all vaules" do
                session = ""
                opt ={"fields" => "address_id, receiver_name, phone, mobile, is_default, location.address, location.zip, location.city, location.district,location.state"}
                @data = @t.taobao_top.get_shipping_addresses(session,opt)
                @obj= JSON.parse(@data)
                @obj["error_response"]["code"] == 27 
                @obj["error_response"]["msg"].should eq "Invalid session:session-is-blank"
            end                
        end
    end
end 
