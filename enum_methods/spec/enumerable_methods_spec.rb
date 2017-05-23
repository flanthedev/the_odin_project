require "enumerable_methods"

describe Enumerable do
  describe "#my_select" do
    context "given an empty array and a block" do
      it "returns an empty array" do
        expect([].my_select { |x| x < 2 }).to eql([])
      end
    end

  end
end
