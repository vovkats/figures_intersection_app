require 'rails_helper'

describe SegmentService do
  describe '.form_segments' do
    it 'returns collection ob points when parameter is not blank ' do
      values = { x: [1, 3, 45], y: [6, 2, 18], x1: [5, 7, 14], y1: [9, 10, 20] }
      klass = FiguresIntersection::Segment
      expect(described_class.form_segments(values)).to include(klass.new(x: 1, y: 6, x1: 5, y1: 9),
                                                               klass.new(x: 3, y: 2, x1: 7, y1: 10),
                                                               klass.new(x: 45, y: 18, x1: 14, y1: 20))
    end

    it 'returns empty array when parameter is blank' do
      expect(described_class.form_segments(nil)).to eq([])
    end
  end
end
