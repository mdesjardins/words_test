require_relative '../lib/processor'

describe Processor do
  it 'should not raise an exception' do
    sample_dictionary = %w(arrows carrots give me)
    expect{ Processor.new(sample_dictionary).go! }.not_to raise_error
  end

  it 'should not return results where the sequence appears more than once' do
    has_duplicates = ['carrots', 'arrows']  # from the gist https://gist.github.com/pedromartinez/7788650
    result = Processor.new(has_duplicates).go!
    expect(result.keys).not_to include 'arro'
  end

  it 'should give the expected output for the sample input from https://gist.github.com/pedromartinez/7788650' do
    sample_dictionary = %w(arrows carrots give me)
    result = Processor.new(sample_dictionary).go!
    expect(result).to include( { 'carr' => 'carrots' } )
    expect(result).to include( { 'give' => 'give' } )
    expect(result).to include( { 'rots' => 'carrots' } )
    expect(result).to include( { 'rows' => 'arrows' } )
    expect(result).to include( { 'rrot' => 'carrots' } )
    expect(result).to include( { 'rrow' => 'arrows' } )
    expect(result.length).to eq 6
  end
end
