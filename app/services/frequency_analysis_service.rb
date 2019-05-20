class FrequencyAnalysisService
  def initialize(body)
    @body = body.downcase
  end

  def call
    sort_by_occurrence
  end

  private

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
