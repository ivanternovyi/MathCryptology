class VigenereCipherService
  def initialize(body, seq, lang)
    @body = body.downcase
    @seq_arr = seq.split(',').map(&:to_i)
    @lang = lang
  end

  def call
    vigenere_cipher
  end

  private

  def alpha_cipher(char, modifier)
    alphabet = if @lang == 'en'
                   Array('a'..'z').prepend('_')
                 else
                   Array(ua_arr).prepend('_')
                 end
    key = alphabet[(alphabet.index(char) + modifier) % alphabet.size]
  end

  def vigenere_cipher
    result = ""

    @body.each_char.with_index do |char, idx|
      key_idx = idx % @seq_arr.length
      key_modifier = @seq_arr[key_idx]
      result << alpha_cipher(char, key_modifier)
    end

    result
  end

  def ua_arr
    [
      'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й', 'к',
      'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ',
      'ь', 'ю', 'я'
    ]
  end
end
