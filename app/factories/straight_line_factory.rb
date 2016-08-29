class StraightLineFactory

  def self.build(k:, b:)
    FiguresIntersection::StraightLine.new(k: k.to_f, b: b.to_f)
  end
end