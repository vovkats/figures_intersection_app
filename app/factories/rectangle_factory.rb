class RectangleFactory

  def self.build(x:, y:, x1:, y1:)
    FiguresIntersection::Rectangle.new(x: x.to_f, y: y.to_f, x1: x1.to_f, y1: y1.to_f)
  end
end