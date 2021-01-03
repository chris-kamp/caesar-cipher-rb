require './lib/caesar.rb'

describe Caesar do
  describe "#encode" do
    it "encodes a string of lower case letters" do
      caesar = Caesar.new
      expect(caesar.encode("helloworld", 13)).to eql("uryybjbeyq")
    end
    it "preserves case" do
      caesar = Caesar.new
      expect(caesar.encode("HelloWorld", 6)).to eql("NkrruCuxrj")
    end
    it "preserves spaces and punctuation" do
      caesar = Caesar.new
      expect(caesar.encode("!! Oh_h@i.th3re", 19)).to eql("!! Ha_a@b.ma3kx")
    end
    it "handles rotation greater than 26" do
      caesar = Caesar.new
      expect(caesar.encode("helloworld", 75)).to eql("ebiiltloia")
    end
    it "handles negative rotation" do
      caesar = Caesar.new
      expect(caesar.encode("abcde", -2)).to eql("yzabc")
    end
  end
end
