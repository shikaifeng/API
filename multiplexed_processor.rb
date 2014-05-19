module Thrift
  module Processor
    def write_result(result, oprot, name, seqid)
      #oprot.write_message_begin(name, MessageTypes::REPLY, seqid)
      if @service_name
        oprot.write_message_begin(@service_name + ':' + name, MessageTypes::REPLY, seqid)
      else
        oprot.write_message_begin(name, MessageTypes::REPLY, seqid)
      end
      result.write(oprot)
      oprot.write_message_end
      oprot.trans.flush
    end
  end

  class MultiplexedProcessor
    def initialize
      @actual_processors = Hash.new
    end
 
    def register(service_name, processor)
      processor.instance_variable_set(:@service_name, service_name)
      @actual_processors[service_name] = processor
    end
 
    def process(iprot, oprot)
      name, type, seqid  = iprot.read_message_begin
      service_name, method = name.split(':')
      actual_processor = @actual_processors[service_name]
      if actual_processor.respond_to?("process_#{method}")
        actual_processor.send("process_#{method}", seqid, iprot, oprot)
        true
      else
        iprot.skip(Types::STRUCT)
        iprot.read_message_end
        x = ApplicationException.new(ApplicationException::UNKNOWN_METHOD, 'Unknown function ' + name)
        oprot.write_message_begin(name, MessageTypes::EXCEPTION, seqid)
        x.write(oprot)
        oprot.write_message_end
        oprot.trans.flush
        false
      end
    end
  end
end