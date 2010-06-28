module Addy
  def summation(injectable = nil)
    injectable ||= self
    
    raise "#{injectable.class.name} does not implement inject." unless injectable.respond_to? :inject
    
    injectable.inject(0) do |memo, num|
      if block_given?
        yield(num) + memo
      else
        num + memo
      end
    end
  end
  
  alias :sum :summation
end