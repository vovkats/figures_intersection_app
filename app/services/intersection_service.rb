class IntersectionService
  attr_reader :points, :rectangles, :segments, :straight_lines, :vertical_lines

  def initialize(params)
    @points         = PointService.form_points(params[:figures][:points])
    @rectangles     = RectangleService.form_rectangles(params[:figures][:rectangles])
    @segments       = SegmentService.form_segments(params[:figures][:segments])
    @straight_lines = StraightLineService.form_straight_lines(params[:figures][:straight_lines])
    @vertical_lines = VerticalLineService.form_vertical_lines(params[:figures][:vertical_lines])
  end

  def figures
    @figures ||= points + rectangles + segments + straight_lines + vertical_lines
  end

  def result
    result = []
    figures.each_with_index do |figure, index|
      figures.each_with_index do |compared_figure, compared_index|
        next if index == compared_index

        intersection = figure.intersect(compared_figure)
        intersection = Intersection.new(first_figure: figure,
                                        second_figure: compared_figure,
                                        result: intersection)

        unless result.find { |result_intersection| result_intersection == intersection }
          result << intersection
        end
      end
    end

    result
  end
end
