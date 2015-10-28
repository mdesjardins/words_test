require_relative './lib/processor'

sequence_file = File.open('sequences.txt', 'w')
word_file = File.open('words.txt', 'w')

begin
  processor = Processor.new(ARGF)
  processor.go! do |sequence, word|
    sequence_file.puts sequence
    word_file.puts word
  end
ensure
  sequence_file.close
  word_file.close
end

