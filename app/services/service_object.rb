class ServiceObject
  class << self

    def run!(*args, &block)
      service = new(*args)
      if block_given?
        yield(service)
      else
        service.success { |service, *args| return args.first }
      end
      service.run
    rescue => e
      if service && service.phonebook[:failure].present?
        service.fire(:failure, e)
      else
        raise e
      end
    end

  end

  def phonebook
    @phonebook ||= {}
  end

  def on(event, &block)
    phonebook[event] = block
    self
  end

  def fire event, *payload
    phonebook[event].call(self, *payload) unless phonebook[event].blank? and return
  end

  def method_missing(method, *args, &block)
    if block_given? || args.detect {|x| x.is_a? Proc}
      blk = block   || args.detect {|x| x.is_a? Proc}
      on(method, &blk)
    end
  end

end