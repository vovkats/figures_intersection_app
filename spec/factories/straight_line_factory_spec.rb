require 'rails_helper'

describe StraightLineFactory do
  it 'returns Point object when passed data is right' do
    expect(described_class.build(k: '1', b: '2'))
      .to eq(FiguresIntersection::StraightLine.new(k: 1, b: 2))
    expect(described_class.build(k: '3.121', b: '2.34'))
      .to eq(FiguresIntersection::StraightLine.new(k: 3.121, b: 2.34))
    expect(described_class.build(k: '3.121', b: 2.34))
      .to eq(FiguresIntersection::StraightLine.new(k: 3.121, b: 2.34))
  end

  it 'raises error when passed data is wrong' do
    expect { described_class.build(k: 'wrong', b: 'wrong') }
      .to raise_error(FactoryException, 'Arguments should be numbers')
    expect { described_class.build(k: '1', b: 'wrong') }
      .to raise_error(FactoryException, 'Arguments should be numbers')
    expect { described_class.build(k: 'wrong', b: 1) }
      .to raise_error(FactoryException, 'Arguments should be numbers')
  end
end
