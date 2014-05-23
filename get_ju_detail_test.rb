$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require "byebug"
require "api_test"
require "rspec"
require "rspec-expectations"
require "json"

RSpec.describe "Thrift::Api::V1::Test" do
        # get_user_buyer methed test
        describe "get_user_buyer methed test" do
         # normal Test   
          describe "normal Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
                session = "61016161743c6d83e27ba057179b6c04c35b19ff438099584573389"
                opts={"ids" => "35443391108"}
                @data = @t.taobao_top.get_ju_detail(session,opts)
            end
            #1.valid return vaules
            it "valid the return of vaules" do
                @data.should eq "http://dsc.taobaocdn.com/tfscom/T1Fs18FE8aXXXXXXXX%7Cvar%5Edesc%3Bsign%5E2adc44cec654442fb3f35315c20dd304%3Blang%5Egb18030%3Bt%5E1394582535000"
            end
        end
        # unexception Test   
          describe "unexception Test" do
            before :all do
                @t=Thrift::Api::V1::Test.new
            end
            #2.session is blank ,still return values
            it "when session is blank,still returened" do
                session = ""
                opts={"ids" => "35443391108"}
                @data = @t.taobao_top.get_ju_detail(session,opts)
                @data.should eq "http://dsc.taobaocdn.com/tfscom/T1Fs18FE8aXXXXXXXX%7Cvar%5Edesc%3Bsign%5E2adc44cec654442fb3f35315c20dd304%3Blang%5Egb18030%3Bt%5E1394582535000"
            end
            #3.session is blank ,still return values
            it "when session is blank,still returened" do
                session = ""
                opts={"ids" => "35443391108"}
                @data = @t.taobao_top.get_ju_detail(session,opts)
                @data.should eq "http://dsc.taobaocdn.com/tfscom/T1Fs18FE8aXXXXXXXX%7Cvar%5Edesc%3Bsign%5E2adc44cec654442fb3f35315c20dd304%3Blang%5Egb18030%3Bt%5E1394582535000"
            end
            #4.session is error ,still return values
            it "when session is error,still returened" do
                session = "23423423423"
                opts={"ids" => "35443391108"}
                @data = @t.taobao_top.get_ju_detail(session,opts)
                @data.should eq "http://dsc.taobaocdn.com/tfscom/T1Fs18FE8aXXXXXXXX%7Cvar%5Edesc%3Bsign%5E2adc44cec654442fb3f35315c20dd304%3Blang%5Egb18030%3Bt%5E1394582535000"
            end
            #5.ids is blank ,return none   -incomplete
            #it "when ids is blank  is error,still returened" do
            #    session = "61016161743c6d83e27ba057179b6c04c35b19ff438099584573389"
            #    opts={"ids" => ""}
            #    @data = @t.taobao_top.get_ju_detail(session,opts)
            #    puts @data
            #end
        end
    end
end
