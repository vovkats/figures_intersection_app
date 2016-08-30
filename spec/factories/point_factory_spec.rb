require 'rails_helper'

describe PointFactory do
  it 'returns Point object when passed data is right' do
    expect(described_class.build(x: 1, y: 2)).to eq(FiguresIntersection::Point.new(x: 1, y: 2))
    expect(described_class.build(x: 1, y: 2)).to eq(FiguresIntersection::Point.new(x: 1, y: 2))
    expect(described_class.build(x: 1, y: '2.23')).to eq(FiguresIntersection::Point.new(x: 1, y: 2.23))
    expect(described_class.build(x: 1.12, y: 2.23)).to eq(FiguresIntersection::Point.new(x: 1.12, y: 2.23))
  end

  it 'raises error when passed data is wrong' do
    expect { described_class.build(x: 'wrong', y: 'wrong') }.to raise_error(FactoryException, 'Arguments should be numbers')
    expect { described_class.build(x: 'wrong', y: '') }.to raise_error(FactoryException, 'Arguments should be numbers')
  end
end
