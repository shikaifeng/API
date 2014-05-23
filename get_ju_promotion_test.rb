$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"

RSpec.describe "Thrift::Api::V1::Test" do
        # get_ju_promotion methed test
        describe "get_ju_promotion methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                opts=["37786583979","38514269996"]
                @data = @t.taobao_top.get_ju_promotion(opts)
            end
            #1.返回商品的优惠id
            it "Return the item_id's promotion_id" do
                puts @data[0].should eq "jhs-346970143_2184728168"
                puts @data[1].should eq "jhs-346848218_2183668623"
            end
        end
         # unexception Test   
          describe "unexception Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #2.未传商品id，返回优惠信息为空
            it "when item_id is none,return none" do
                opts=[""]
                @data = @t.taobao_top.get_ju_promotion(opts)
                @data[0].should eq ""
            end
            #3.商品id错误，返回优惠信息为空
            it "when item_id is none,return none" do
                opts=["112312312"]
                @data = @t.taobao_top.get_ju_promotion(opts)
                @data[0].should eq ""
            end
        end
    end
end