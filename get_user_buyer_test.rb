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
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opt = {"fields" => "user_id,nick,sex,avatar"}
                @data = @t.taobao_top.get_user_buyer(session,opt)
                @obj= JSON.parse(@data)
                #puts @obj
            end
            #1.valid nick
            it "returned nick" do
                @obj["user_buyer_get_response"]["user"].count.should == 2
                @obj["user_buyer_get_response"]["user"]["nick"].should eq "kaifeng15"
            end
            #2.valid avatar
            it "returned avatar" do
                @obj["user_buyer_get_response"]["user"]["avatar"].should eq "http://img.taobaocdn.com/sns_logo/i4/T1G4imXhNhXXb1upjX.jpg"
            end
         end
     
         #unexpection test
         describe "unexpection Test" do
            before :each do
                @t=Thrift::Api::V1::Test.new
            end
            #3.session is blank no data returned
            it "when session is blank,returened error message" do
                session = ""
                opt = {"fields" => "user_id,nick,sex,avatar"}
                @data = @t.taobao_top.get_user_buyer(session,opt)
                @obj= JSON.parse(@data)
                #puts @obj
                @obj["error_response"]["code"] == 27
                @obj["error_response"]["msg"].should eq "Invalid session:session-is-blank"
            end
            #4.session is error no data returned
            it "when session is error,returned  error message" do
                session = "1233434354353"
                opt = {"fields" => "user_id,nick,sex,avatar"}
                @data = @t.taobao_top.get_user_buyer(session,opt)
                @obj= JSON.parse(@data)
                #puts @obj     
                @obj["error_response"]["code"] == 27
                @obj["error_response"]["msg"].should eq "Invalid session"
            end
            #5.opt is blank no data returned
            it "when opt is blank,returned all vaulse" do
                session = "6100506425279d184141918e66dd4e6368eca7e24a1e92489310901"
                opt = {"fields" => ""}
                @data = @t.taobao_top.get_user_buyer(session,opt)
                @obj= JSON.parse(@data)
                puts @obj     
            end
         end
      end
   end
