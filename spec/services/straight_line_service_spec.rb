require 'rails_helper'

describe StraightLineService do
  describe '.form_straight_lines' do
    it 'returns collection ob points when parameter is not blank ' do
      values = { k: [1, 3, 45], b: [6, 2, 18] }
      klass = FiguresIntersection::StraightLine
      expect(described_class.form_straight_lines(values)).to include(klass.new(k: 1, b: 6),
                                                                     klass.new(k: 3, b: 2),
                                                                     klass.new(k: 45, b: 18))
    end

    it 'returns empty array when parameter is blank' do
      expect(described_class.form_straight_lines(nil)).to eq([])
    end
  end
end
