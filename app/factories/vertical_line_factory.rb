class VerticalLineFactory
  NUMBER_REGEX = /(\d+(\.\d+)?)/

  def self.build(a:)
    if a.to_s =~ NUMBER_REGEX
      FiguresIntersection::VerticalLine.new(a: a.to_f)
    else
      raise FactoryException, 'Arguments should be numbers'
    end
  end
end