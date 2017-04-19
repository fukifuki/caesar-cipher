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
    if letter =~ /[a-z]/
      ((letter.ord + key - 'a'.ord) % 26 + 'a'.ord).chr
    else
      shift_letter(letter.downcase, key).upcase
    end
  end
end
