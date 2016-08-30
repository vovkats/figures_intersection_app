require 'rails_helper'

describe PointService do
  describe '.form_points' do
    it 'returns collection ob points when parameter is not blank' do
      values = { x: [1, 3, 5], y: [6, 2, 3] }
      klass = FiguresIntersection::Point
      expect(described_class.form_points(values)).to include(klass.new(x: 1, y: 6),
                                                             klass.new(x: 3, y: 2),
                                                             klass.new(x: 5, y: 3))
    end

    it 'returns empty array when parameter is blank' do
      expect(described_class.form_points(nil)).to eq([])
    end
  end
end
