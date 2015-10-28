require_relative '../lib/sequences'

describe Sequences do
  include Sequences

  it 'should return an empty array if the line is less than SEGMENT_LENGTH characters' do
    input = 'a' * (Sequences::SEGMENT_LENGTH - 1)
    expect(sequences(input)).to eq []
  end

  it 'should return the word itself if the line is equal to SEGMENT_LENGTH characters' do
    input = 'b' * Sequences::SEGMENT_LENGTH
    expect(sequences(input)).to eq [input]    
  end

  it 'should silently ignore bogus input' do
    expect(sequences('12345')).to eq []
    expect(sequences('#@$^&')).to eq []
  end

  it 'should not raise an exception on bogus input' do
    expect{sequences('12345')}.not_to raise_error
    expect{sequences('#@$%$')}.not_to raise_error
  end

  context 'valid examples' do
    # From the problem description: https://gist.github.com/pedromartinez/7788650
    it 'should emit the correct stuff for carrots' do
      expect(sequences('carrots')).to include 'carr'
      expect(sequences('carrots')).to include 'rots'
      expect(sequences('carrots')).to include 'rrot'
    end

    it 'should emit the correct stuff for give' do
      expect(sequences('give')).to include 'give'
    end

    it 'should emit the correct stuff for arrows' do
      expect(sequences('arrows')).to include 'rows'
    end

    it 'should emit the correct stuff for me' do
      expect(sequences('me')).to be_empty
    end
  end
end
