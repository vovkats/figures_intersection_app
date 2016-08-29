class RectangleService
  def self.form_rectangles(rectangles_coords)
    return [] if rectangles_coords.blank?

    rectangles = []
    rectangles_coords[:x].count.times do |index|
      rectangles << RectangleFactory.build(x: rectangles_coords[:x][index], y: rectangles_coords[:y][index],
                                           x1: rectangles_coords[:x1][index], y1: rectangles_coords[:y1][index])
    end

    rectangles
  end
end
