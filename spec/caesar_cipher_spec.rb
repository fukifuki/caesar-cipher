require 'caesar_cipher'

describe CaesarCipher do
  
  describe "#initialize" do
    it "is initialized with a piece of text and a key" do
      cipher = CaesarCipher.new("Sample Text", 3)
      expect(cipher.text).to eq "Sample Text"
      expect(cipher.key).to eq 3
    end
  end

  describe "#encode" do
    context "given a text that contains only letters that don't go out of the alphabet bounds when shifted" do
      it "returns encoded text" do
        cipher = CaesarCipher.new("encode", 2)
        expect(cipher.encode).to eq("gpeqfg")        
      end      
    end

    context "given a word that contains mixed case letters" do
      it "takes the case of the letter into account" do
        cipher = CaesarCipher.new("eNCoDe", 2)
        expect(cipher.encode).to eq("gPEqFg")
      end
    end

    context "given a negative key" do
      it "counts baskwards" do
        cipher = CaesarCipher.new("encode", -2)
        expect(cipher.encode).to eq("clambc")
      end
    end

    context "given a too big positive key" do
      it "goes back to start of the alphabet after reaching the end" do
        cipher = CaesarCipher.new("wet", 5)
        expect(cipher.encode).to eq("bgv")  
      end
    end

    context "given a too big negative key" do
      it "goes to the end of the alphabet after reaching the first letter" do
        cipher = CaesarCipher.new("bat", -5)
        expect(cipher.encode).to eq("wvo")
      end
    end

    context "given a non-alphabtic character" do
      xit "returns the same character" do
        cipher = CaesarCipher.new("hey, ho!", 3)
        expect(cipher.encode).to eq("khb, kr!ma")
      end
    end
  end
end
