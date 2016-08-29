class SegmentFactory

  def self.build(x:, y:, x1:, y1:)
    FiguresIntersection::Segment.new(x: x.to_f, y: y.to_f, x1: x1.to_f, y1: y1.to_f)
  end
end