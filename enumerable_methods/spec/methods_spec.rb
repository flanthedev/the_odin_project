require "methods"

describe Enumerable do
  #let(:ary) { [1, 2, 3] }
  describe "#my_each" do
    context "empty array given" do
      it "returns an Enumerator" do
        expect([].my_each { |x| x < 2 } ).to eql([])
      end
    end
  end
end
