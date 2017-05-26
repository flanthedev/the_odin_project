require "enumerable_methods"

describe Enumerable do
  describe "#my_each" do
    context "give an empty array and a block" do
      it "returns an empty array" do
        expect([].my_each { |x| x < 2 }).to eql([])
      end
    end
    context "give an array and no block" do
      it "returns enumerator class" do
        expect([1, 2, 3].my_each.class).to eql(Enumerator)
      end
    end
    context "give an empty hash and no block" do
      it "returns an empty array" do
        expect({a: 1, b: 2, c: 3}.my_each.class).to eql(Enumerator)
      end
    end
    context "give an array and a block" do
      it "calls the block once for each element" do
        expect([1, 2, 3].my_each { |x| x + 2 }).to eql([3,4,5])
      end
    end

  end
end
