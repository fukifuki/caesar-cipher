class CaesarCipher
  attr_accessor :text, :key
  def initialize text, key
    @text = text
    @key = key
  end

  def encode
    text.chars.map do |char| 
      char =~ /[A-Za-z]/ ? shift_letter(char, key) : char
    end.join
  end

  private
  def shift_letter(letter, key)
    (letter.ord + key).chr
  end
end
