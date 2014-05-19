$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')
require "pp"
require "byebug"
require 'thrift'
require 'top_service_v1'
require "multiplexed_processor"
require "multiplexed_protocol"
require "json"

require "rspec"
require "rspec-expectations"


module Thrift
    module Api
        module V1
            class Test
                attr_accessor :transport
                attr_accessor :taobao_top
                def initialize()
                    @socket    = Thrift::Socket.new('218.108.129.132', 12100)
                    @transport = Thrift::BufferedTransport.new(@socket)    
                    taobao_top_protocol   = Thrift::MultiplexedProtocol.new(@transport, 'taobao_top_v1_processor')
                    @taobao_top = TaobaoThrift::TopServiceV1::Client.new(taobao_top_protocol)    
                    @transport.open
                end
            end
        end
    end
end



begin 
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
                puts @obj
            end
            #1.valid address 
            it "returned address" do
                @obj["shipping_addresses_get_response"]["shipping_addresss"]["shipping_address"].count.should == 8
            end
         end
      end
   end 
end 