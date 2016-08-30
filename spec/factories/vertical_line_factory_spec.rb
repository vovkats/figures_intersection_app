require 'rails_helper'

describe VerticalLineFactory do
  it 'returns Point object when passed data is right' do
    expect(described_class.build(a: '2.34'))
      .to eq(FiguresIntersection::VerticalLine.new(a: 2.34))
    expect(described_class.build(a: '3'))
      .to eq(FiguresIntersection::VerticalLine.new(a: 3))
  end

  it 'raises error when passed data is wrong' do
    expect { described_class.build(a: 'wrong') }
      .to raise_error(FactoryException, 'Arguments should be numbers')
  end
end
