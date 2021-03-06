=begin
module Thrift
  module Client
    alias :old_initialize :initialize
 
    def initialize(service_name, iprot, oprot=nil)
      old_initialize(iprot, oprot)
      @service_name = service_name
    end
 
    def send_message(name, args_class, args = {})
      @oprot.write_message_begin(@service_name + ':' + name, MessageTypes::CALL, @seqid)
      data = args_class.new
      args.each do |k, v|
        data.send("#{k.to_s}=", v)
      end
      begin
        data.write(@oprot)
      rescue StandardError => e
        @oprot.trans.close
        raise e
      end
      @oprot.write_message_end
      @oprot.trans.flush
    end
  end
end
=end