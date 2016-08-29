class VerticalLineFactory

  def self.build(a:)
    FiguresIntersection::VerticalLine.new(a: a.to_f)
  end
end