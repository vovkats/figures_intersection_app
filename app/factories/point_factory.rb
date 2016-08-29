class PointFactory

  def self.build(x:, y:)
    FiguresIntersection::Point.new(x: x.to_f, y: y.to_f)
  end
end