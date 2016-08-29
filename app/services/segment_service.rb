class SegmentService
  def self.form_segments(segments_coords)
    return [] if segments_coords.blank?

    segments = []
    segments_coords[:x].count.times do |index|
      segments << SegmentFactory.build(x: segments_coords[:x][index], y: segments_coords[:y][index],
                                       x1: segments_coords[:x1][index], y1: segments_coords[:y1][index])
    end

    segments
  end
end
