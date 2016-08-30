require 'rails_helper'

describe VerticalLineService do
  describe '.form_vertical_lines' do
    it 'returns collection ob points when parameter is not blank ' do
      values = { a: [1, 3, 45] }
      klass = FiguresIntersection::VerticalLine
      expect(described_class.form_vertical_lines(values)).to include(klass.new(a: 1),
                                                                     klass.new(a: 3),
                                                                     klass.new(a: 45))
    end

    it 'returns empty array when parameter is blank' do
      expect(described_class.form_vertical_lines(nil)).to eq([])
    end
  end
end
