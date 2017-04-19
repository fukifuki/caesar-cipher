class CaesarCipher
  attr_accessor :text, :key
  def initialize text, key
    @text = text
    @key = key
  end

  def encode
    text.chars.map { |ch| (ch.ord + key).chr }.join
  end
end
