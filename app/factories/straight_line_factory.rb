class StraightLineFactory
  NUMBER_REGEX = /(\d+(\.\d+)?)/

  def self.build(k:, b:)
    if k.to_s =~ NUMBER_REGEX && b.to_s =~ NUMBER_REGEX
      FiguresIntersection::StraightLine.new(k: k.to_f, b: b.to_f)
    else
      raise FactoryException, 'Arguments should be numbers'
    end
  end
end