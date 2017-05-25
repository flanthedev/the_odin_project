require "caesar_cipher"

describe "caesar_cipher" do
  context "when shift is 0" do
    it "returns the same text" do
      expect(caesar_cipher("hello",0)).to eql "hello"
    end
  end
  context "the string is empty" do
    it "returns an empty string" do
      expect(caesar_cipher("",3)).to eql("")
    end
  end
  context "single letters" do
    it "a with shift 3 returns letter d" do
      expect(caesar_cipher("a",3)).to eql("d")
    end
    it "a with shift 5 returns f" do
      expect(caesar_cipher("a",5)).to eql("f")
    end
  end
  context "mixed cases" do
    it "can cipher mixed cases" do
     expect(caesar_cipher("abc",1)).to eql ("bcd")
     expect(caesar_cipher("AazZ",1)).to eql ("BbaA")
     expect(caesar_cipher("AbCqRwxYz",7)).to eql ("HiJxYdeFg")
     expect(caesar_cipher("What is the time?", 3)).to eql ("Zkdw lv wkh wlph?")
    end
  end
  context "non letter characters" do
    it "does not shift numbers, punctuation, or white space" do
      expect(caesar_cipher("123 45", 4)).to eql ("123 45")
      expect(caesar_cipher("Wow! yes, what a great day; right?", 5)).to eql ("Btb! djx, bmfy f lwjfy ifd; wnlmy?")
    end
  end
  context "negative shifts" do
    it "can ciphers with a negative shift" do
      expect(caesar_cipher("What's going on with you?", -4)).to eql("Sd]p'o ckejc kj sepd ukq?")
    end
  end






end
