class SegmentFactory
  NUMBER_REGEX = /(\d+(\.\d+)?)/

  def self.build(x:, y:, x1:, y1:)
    if x.to_s =~ NUMBER_REGEX && y.to_s =~ NUMBER_REGEX && x1.to_s =~ NUMBER_REGEX && y1.to_s =~ NUMBER_REGEX
      if x.to_f == x1.to_f && y.to_f == y1.to_f
        raise FactoryException, 'Arguments must have different points'
      else
        FiguresIntersection::Segment.new(x: x.to_f, y: y.to_f, x1: x1.to_f, y1: y1.to_f)
      end
    else
      raise FactoryException, 'Arguments should be numbers'
    end
  end
end