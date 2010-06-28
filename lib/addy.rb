module Addy
  def summation(injectable = nil)
    injectable ||= self
    
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