module Addy
  def summation(range)
    range.inject(0) do |memo, num|
      if block_given?
        yield(num) + memo
      else
        num + memo
      end
    end
  end
  
  alias :sum :summation
end