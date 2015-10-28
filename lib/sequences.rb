module Sequences
  SEGMENT_LENGTH=4

  # expects a word, returns each four-character sequence
  # within that word in an array.
  def sequences(line)
    return [] if line.length < SEGMENT_LENGTH
    return [] unless /^[A-Za-z]*$/.match(line)
    return [line] if line.length == SEGMENT_LENGTH
    #raise ArgumentError.new("Input #{line} does not match expected input") unless /^[A-Za-z]*$/.match(line)
    result = []
    0.upto(line.length - SEGMENT_LENGTH) do |i|
      result << line[i...i+SEGMENT_LENGTH]
    end
    result
  end
end
