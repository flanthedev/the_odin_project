require "bubble"

describe "bubble_sort" do
  context "bubble sorts an array" do
    it " can sort numbers 1-9" do
      #array = [9,1,8,2,7,3,6,4,5]
      expect(bubble_sort([9,1,8,2,7,3,6,4,5])).to eql([1,2,3,4,5,6,7,8,9])
    end
  end
end
