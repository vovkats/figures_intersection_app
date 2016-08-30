require 'rails_helper'

describe RectangleFactory do
  it 'returns Point object when passed data is right' do
    expect(described_class.build(x: '1', y: '2', x1: '3', y1: '4'))
      .to eq(FiguresIntersection::Rectangle.new(x: 1, y: 2, x1: 3, y1: 4))
    expect(described_class.build(x: '1', y: '2', x1: 3, y1: '4'))
      .to eq(FiguresIntersection::Rectangle.new(x: 1, y: 2, x1: 3, y1: 4))
    expect(described_class.build(x: 1, y: '2', x1: 3, y1: '4'))
      .to eq(FiguresIntersection::Rectangle.new(x: 1, y: 2, x1: 3, y1: 4))
    expect(described_class.build(x: 1.1, y: '2', x1: 3, y1: '4.6'))
      .to eq(FiguresIntersection::Rectangle.new(x: 1.1, y: 2, x1: 3, y1: 4.6))
  end

  it 'raises error when passed data is wrong' do
    expect { described_class.build(x: 'wrong', y: 'wrong', x1: '1', y1: '1') }
      .to raise_error(FactoryException, 'Arguments should be numbers')
    expect { described_class.build(x: '1', y: '2', x1: 'wrong', y1: 'wrong') }
      .to raise_error(FactoryException, 'Arguments should be numbers')
  end
end
