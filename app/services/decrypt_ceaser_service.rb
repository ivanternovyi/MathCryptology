class DecryptCeaserService
  def initialize(body)
    @body = body.downcase
  end

  def call
    decrypt_caesar.join
  end

  private

  def english_frequency
    'etaoinshrdlcumwfgypbvkjxqz'
  end

  def decrypt_caesar
    body_frequency = sort_by_occurrence
    body_frequency_arr = []
    body_frequency.chars.map { |c| body_frequency_arr << c }
    english_frequency_arr = []
    english_frequency.chars.map { |c| english_frequency_arr << c }
    corresponder = Hash[english_frequency_arr.zip(body_frequency_arr)]
    @body.chars.map { |c| corresponder.fetch(c, " ") }
  end

  def sort_by_occurrence
    arr = []
    @body.each_char { |ch| arr << ch }
    arr.each_with_object(Hash.new(0)) { |word, counts| counts[word] += 1 }
       .sort_by { |k, v| -v }
       .flatten
       .delete_if { |e| e.is_a?(Integer) }
       .join('')
  end
end
