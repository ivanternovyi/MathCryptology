class CeaserCipherService
  def initialize(body, lang, shift)
    @body = body.downcase
    @lang = lang
    @shift = shift.to_i
  end

  def call
    caesar_cipher.join
  end

  private

  def caesar_cipher
    alphabet   = if @lang == 'en'
                   Array('a'..'z').prepend('_')
                 else
                   Array(ua_arr).prepend('_')
                 end
    encrypter  = Hash[alphabet.zip(alphabet.rotate(@shift))]
    @body.chars.map { |c| encrypter.fetch(c, " ") }
  end

  def ua_arr
    [
      'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й', 'к',
      'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ',
      'ь', 'ю', 'я' 
    ]
  end
end
