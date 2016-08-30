class PointFactory
  NUMBER_REGEX = /(\d+(\.\d+)?)/

  def self.build(x:, y:)
    if x.to_s =~ NUMBER_REGEX && y.to_s =~ NUMBER_REGEX
      FiguresIntersection::Point.new(x: x.to_f, y: y.to_f)
    else
      raise FactoryException, 'Arguments should be numbers'
    end
  end
end