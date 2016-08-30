class SegmentFactory
  NUMBER_REGEX = /(\d+(\.\d+)?)/

  def self.build(x:, y:, x1:, y1:)
    if x.to_s =~ NUMBER_REGEX && y.to_s =~ NUMBER_REGEX &&
       x1.to_s =~ NUMBER_REGEX && y1.to_s =~ NUMBER_REGEX
      FiguresIntersection::Segment.new(x: x.to_f, y: y.to_f, x1: x1.to_f, y1: y1.to_f)
    else
      raise FactoryException, 'Arguments should be numbers'
    end
  end
end