module FigureHelper
  def render_figure(figure)
    if figure.is_a?(FiguresIntersection::Point)
      render partial: 'figures/point', locals: { point: figure }
    elsif figure.is_a?(FiguresIntersection::Rectangle)
      render partial: 'figures/rectangle', locals: { rectangle: figure }
    elsif figure.is_a?(FiguresIntersection::Segment)
      render partial: 'figures/segment', locals: { segment: figure }
    elsif figure.is_a?(FiguresIntersection::StraightLine)
      render partial: 'figures/straight_line', locals: { straight_line: figure }
    elsif figure.is_a?(FiguresIntersection::VerticalLine)
      render partial: 'figures/vertical_line', locals: { vertical_line: figure }
    else
      render partial: 'figures/not_intersection'
    end
  end

  def coords_step
    0.01
  end
end
