#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'alipay_types'

    module AlipayThrift
      module MapiServiceV1
        class Client
          include ::Thrift::Client

          def getqrcode(params)
            send_getqrcode(params)
            return recv_getqrcode()
          end

          def send_getqrcode(params)
            send_message('getqrcode', Getqrcode_args, :params => params)
          end

          def recv_getqrcode()
            result = receive_message(Getqrcode_result)
            return result.success unless result.success.nil?
            raise result.ire unless result.ire.nil?
            raise result.ue unless result.ue.nil?
            raise result.te unless result.te.nil?
            raise result.ide unless result.ide.nil?
            raise result.why unless result.why.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getqrcode failed: unknown result')
          end

          def getauthstate(params)
            send_getauthstate(params)
            return recv_getauthstate()
          end

          def send_getauthstate(params)
            send_message('getauthstate', Getauthstate_args, :params => params)
          end

          def recv_getauthstate()
            result = receive_message(Getauthstate_result)
            return result.success unless result.success.nil?
            raise result.ire unless result.ire.nil?
            raise result.ue unless result.ue.nil?
            raise result.te unless result.te.nil?
            raise result.ide unless result.ide.nil?
            raise result.why unless result.why.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getauthstate failed: unknown result')
          end

          def pay(params)
            send_pay(params)
            return recv_pay()
          end

          def send_pay(params)
            send_message('pay', Pay_args, :params => params)
          end

          def recv_pay()
            result = receive_message(Pay_result)
            return result.success unless result.success.nil?
            raise result.ire unless result.ire.nil?
            raise result.ue unless result.ue.nil?
            raise result.te unless result.te.nil?
            raise result.ide unless result.ide.nil?
            raise result.why unless result.why.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'pay failed: unknown result')
          end

          def querypayresult(params)
            send_querypayresult(params)
            return recv_querypayresult()
          end

          def send_querypayresult(params)
            send_message('querypayresult', Querypayresult_args, :params => params)
          end

          def recv_querypayresult()
            result = receive_message(Querypayresult_result)
            return result.success unless result.success.nil?
            raise result.ire unless result.ire.nil?
            raise result.ue unless result.ue.nil?
            raise result.te unless result.te.nil?
            raise result.ide unless result.ide.nil?
            raise result.why unless result.why.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'querypayresult failed: unknown result')
          end

        end

        class Processor
          include ::Thrift::Processor

          def process_getqrcode(seqid, iprot, oprot)
            args = read_args(iprot, Getqrcode_args)
            result = Getqrcode_result.new()
            begin
              result.success = @handler.getqrcode(args.params)
            rescue AlipayThrift::InvalidRequestException => ire
              result.ire = ire
            rescue AlipayThrift::UnavailableException => ue
              result.ue = ue
            rescue AlipayThrift::TimedOutException => te
              result.te = te
            rescue AlipayThrift::InvalideResponseDataException => ide
              result.ide = ide
            rescue AlipayThrift::JSONParseException => why
              result.why = why
            end
            write_result(result, oprot, 'getqrcode', seqid)
          end

          def process_getauthstate(seqid, iprot, oprot)
            args = read_args(iprot, Getauthstate_args)
            result = Getauthstate_result.new()
            begin
              result.success = @handler.getauthstate(args.params)
            rescue AlipayThrift::InvalidRequestException => ire
              result.ire = ire
            rescue AlipayThrift::UnavailableException => ue
              result.ue = ue
            rescue AlipayThrift::TimedOutException => te
              result.te = te
            rescue AlipayThrift::InvalideResponseDataException => ide
              result.ide = ide
            rescue AlipayThrift::JSONParseException => why
              result.why = why
            end
            write_result(result, oprot, 'getauthstate', seqid)
          end

          def process_pay(seqid, iprot, oprot)
            args = read_args(iprot, Pay_args)
            result = Pay_result.new()
            begin
              result.success = @handler.pay(args.params)
            rescue AlipayThrift::InvalidRequestException => ire
              result.ire = ire
            rescue AlipayThrift::UnavailableException => ue
              result.ue = ue
            rescue AlipayThrift::TimedOutException => te
              result.te = te
            rescue AlipayThrift::InvalideResponseDataException => ide
              result.ide = ide
            rescue AlipayThrift::JSONParseException => why
              result.why = why
            end
            write_result(result, oprot, 'pay', seqid)
          end

          def process_querypayresult(seqid, iprot, oprot)
            args = read_args(iprot, Querypayresult_args)
            result = Querypayresult_result.new()
            begin
              result.success = @handler.querypayresult(args.params)
            rescue AlipayThrift::InvalidRequestException => ire
              result.ire = ire
            rescue AlipayThrift::UnavailableException => ue
              result.ue = ue
            rescue AlipayThrift::TimedOutException => te
              result.te = te
            rescue AlipayThrift::InvalideResponseDataException => ide
              result.ide = ide
            rescue AlipayThrift::JSONParseException => why
              result.why = why
            end
            write_result(result, oprot, 'querypayresult', seqid)
          end

        end

        # HELPER FUNCTIONS AND STRUCTURES

        class Getqrcode_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          PARAMS = 1

          FIELDS = {
            PARAMS => {:type => ::Thrift::Types::MAP, :name => 'params', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Getqrcode_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          IRE = 1
          UE = 2
          TE = 3
          IDE = 4
          WHY = 5

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
            IRE => {:type => ::Thrift::Types::STRUCT, :name => 'ire', :class => AlipayThrift::InvalidRequestException},
            UE => {:type => ::Thrift::Types::STRUCT, :name => 'ue', :class => AlipayThrift::UnavailableException},
            TE => {:type => ::Thrift::Types::STRUCT, :name => 'te', :class => AlipayThrift::TimedOutException},
            IDE => {:type => ::Thrift::Types::STRUCT, :name => 'ide', :class => AlipayThrift::InvalideResponseDataException},
            WHY => {:type => ::Thrift::Types::STRUCT, :name => 'why', :class => AlipayThrift::JSONParseException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Getauthstate_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          PARAMS = 1

          FIELDS = {
            PARAMS => {:type => ::Thrift::Types::MAP, :name => 'params', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Getauthstate_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          IRE = 1
          UE = 2
          TE = 3
          IDE = 4
          WHY = 5

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
            IRE => {:type => ::Thrift::Types::STRUCT, :name => 'ire', :class => AlipayThrift::InvalidRequestException},
            UE => {:type => ::Thrift::Types::STRUCT, :name => 'ue', :class => AlipayThrift::UnavailableException},
            TE => {:type => ::Thrift::Types::STRUCT, :name => 'te', :class => AlipayThrift::TimedOutException},
            IDE => {:type => ::Thrift::Types::STRUCT, :name => 'ide', :class => AlipayThrift::InvalideResponseDataException},
            WHY => {:type => ::Thrift::Types::STRUCT, :name => 'why', :class => AlipayThrift::JSONParseException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Pay_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          PARAMS = 1

          FIELDS = {
            PARAMS => {:type => ::Thrift::Types::MAP, :name => 'params', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Pay_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          IRE = 1
          UE = 2
          TE = 3
          IDE = 4
          WHY = 5

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
            IRE => {:type => ::Thrift::Types::STRUCT, :name => 'ire', :class => AlipayThrift::InvalidRequestException},
            UE => {:type => ::Thrift::Types::STRUCT, :name => 'ue', :class => AlipayThrift::UnavailableException},
            TE => {:type => ::Thrift::Types::STRUCT, :name => 'te', :class => AlipayThrift::TimedOutException},
            IDE => {:type => ::Thrift::Types::STRUCT, :name => 'ide', :class => AlipayThrift::InvalideResponseDataException},
            WHY => {:type => ::Thrift::Types::STRUCT, :name => 'why', :class => AlipayThrift::JSONParseException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Querypayresult_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          PARAMS = 1

          FIELDS = {
            PARAMS => {:type => ::Thrift::Types::MAP, :name => 'params', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Querypayresult_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          IRE = 1
          UE = 2
          TE = 3
          IDE = 4
          WHY = 5

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
            IRE => {:type => ::Thrift::Types::STRUCT, :name => 'ire', :class => AlipayThrift::InvalidRequestException},
            UE => {:type => ::Thrift::Types::STRUCT, :name => 'ue', :class => AlipayThrift::UnavailableException},
            TE => {:type => ::Thrift::Types::STRUCT, :name => 'te', :class => AlipayThrift::TimedOutException},
            IDE => {:type => ::Thrift::Types::STRUCT, :name => 'ide', :class => AlipayThrift::InvalideResponseDataException},
            WHY => {:type => ::Thrift::Types::STRUCT, :name => 'why', :class => AlipayThrift::JSONParseException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

      end

    end