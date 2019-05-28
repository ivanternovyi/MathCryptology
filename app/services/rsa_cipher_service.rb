require 'prime'

class Integer
  # a^b mod c
  def self.mod_pow(base, exp, mod)
    return 1 if exp.zero?
    return base % mod if exp == 1

    res = mod_pow(base, exp/2, mod)
    res = (res * res) % mod

    return res if exp % 2 == 0
    ((base % mod) * res) % mod
  end
end

class RsaCipherService
  def initialize(body)
    @p = 7
    @q = 17
    @body = body.downcase
  end

  def call
    res = ""
    enc = encrypt(@body)
    res += "Encrypted: #{enc}\n"
    res += "\nDecrypted: #{decrypt(enc)}"
  end

  private

  def encrypt(data)
    res = ''
    data.each_char do |ch|
      res += Integer.mod_pow(ch.ord, generate_keys[:e], generate_keys[:n]).chr
    end
    res
  end

  def decrypt(data)
    res = ''
    data.each_char do |ch|
      res += Integer.mod_pow(ch.ord, generate_keys[:d], generate_keys[:n]).chr
    end
    res
  end

  def generate_keys
    n = @p * @q
    phi = (@p - 1) * (@q - 1)
    e = find_coprime(phi, 3)
    d = calc_d(e)
    { n: n, e: e, d: d }
  end

  def gcd(a, b)
    b.zero? ? a : gcd(b, a % b)
  end

  def extended_gcd(a, b)
    return [0, 1] if (a % b).zero?

    x, y = extended_gcd(b, a % b)
    [y, x - y * (a / b)]
  end

  def calc_d(e)
    t = (@p - 1) * (@q - 1)
    x, _y = extended_gcd(e, t)
    x += t if x < 0
    x
  end

  def find_coprime(a, z)
    return z if gcd(a, z) == 1

    find_coprime(a, z + 1)
  end
end
