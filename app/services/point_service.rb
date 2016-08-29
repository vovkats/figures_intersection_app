class PointService
  def self.form_points(points_coords)
    return [] if points_coords.blank?

    # points =>{"x"=>["12", "1"], "y"=>["1", "1"]}
    points = []
    points_coords[:x].count.times do |index|
      points << PointFactory.build(x: points_coords[:x][index], y: points_coords[:y][index])
    end

    points
  end
end
