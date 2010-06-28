require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Addy do
  describe "#sum" do
    before(:all) do
      class NotInjectable
        include ::Addy
      end
    end
    
    context "when sum is called with a parameter" do
      before(:all) do
        class ::Object
          include ::Addy
        end
      end
    
      it "should calculate the sum of the values passed in when no block is given" do
        sum(1..5).should == 15
      end
    
      it "should calculate the sum of the results of the block for the values passed in when a block is given" do
        sum(1..3) {|i| i**i }.should == 32
      end
      
      it "should raise an exception when self does not respond to inject" do
        lambda {sum NotInjectable.new}.should raise_error "NotInjectable does not implement inject."
      end
    end
    
    context "when sum is called without a parameter" do
      before(:all) do
        class ::Range
          include ::Addy
        end
      end
      
      it "should calculate the sum of the values of self when no block is given" do
        (1..5).sum.should == 15
      end
            
      it "should calculate the sum of the results of the block for each value of self when a block is given" do
        (1..3).sum {|i| i**i }.should == 32
      end
      
      it "should raise an exception when self does not respond to inject" do
        lambda {NotInjectable.new.sum}.should raise_error "NotInjectable does not implement inject."
      end
    end
  end
end
