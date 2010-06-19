require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Addy do
  before(:all) do
    class ::Object
      include ::Addy
    end
  end
  
  describe "#sum" do
    context "when no block is given" do
      it "should calculate the sum of the values in the range" do
        sum(1..5).should == 15
      end
    end
    
    context "when a block is given" do
      it "should calculate the sum of the results of the block for each value in the range" do
        sum(1..3) {|i| i**i }.should == 32
      end
    end
  end
end
