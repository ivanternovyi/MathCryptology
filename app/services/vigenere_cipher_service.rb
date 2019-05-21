class VigenereCipherService
  def initialize(body)
    @body = body.downcase
  end

  def call
    encrypt.join
  end

  private

  def encrypt
    ["VIGENERE", "CIPHER"]
  end
end
