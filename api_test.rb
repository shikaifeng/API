$:.unshift '.'
$:.unshift File.join(File.dirname(__FILE__), 'gen-rb')

require 'thrift'
require 'top_service_v1'
require "multiplexed_processor"
require "multiplexed_protocol"

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
