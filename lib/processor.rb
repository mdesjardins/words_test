require_relative './sequences'
require 'set'

class Processor
  include Sequences

  # Initialize with something Enumerable (specifically
  # something that responds to 'each', e.g., a file or an
  # array).
  def initialize(enumerable)
    @enumerable = enumerable
  end

  # This function can work w/ a block into which two params
  # are passed: a sequence of four letters and the
  # corresponding word from whence it came.  It also returns
  # its results if that's how you roll.
  #
  def go!
    results = {}
    dups = []

    @enumerable.each do |line|
      line.strip!
      sequences(line).each do |sequence|
        if results[sequence]
          dups << sequence
        else
          results[sequence] = line
        end
      end
    end
    
    # Remove dups from the results map
    dups.each { |dup| results.delete(dup) }
   
    if block_given?
      results.each do |k,v|
        yield(k,v)
      end
    end

    results
  end
end
