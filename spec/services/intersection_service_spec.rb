require 'rails_helper'

describe IntersectionService do
  describe '.result' do
    it 'returns Intersection of objects' do
      first_point = FiguresIntersection::Point.new(x: 1, y: 2)
      second_point = FiguresIntersection::Point.new(x: 1, y: 2)
      third_point = FiguresIntersection::Point.new(x: 1, y: 1)
      segment = FiguresIntersection::Segment.new(x: 1, y: 2, x1: 5, y1: 6)
      rectangle = FiguresIntersection::Rectangle.new(x: 1, y: 4, x1: 8, y1: 8)

      figures = { figures:
                      { points: { x: [1, 1, 1], y: [2, 2, 1] },
                        segments: { x: [1], y: [2], x1: [5], y1: [6] },
                        rectangles: { x: [1], y: [4], x1: [8], y1: [8] } } }

      first_intersection = Intersection.new(first_figure: first_point, second_figure: second_point,
                                            result: first_point.intersect(second_point))
      second_intersection = Intersection.new(first_figure: first_point, second_figure: third_point,
                                             result: first_point.intersect(third_point))
      third_intersection = Intersection.new(first_figure: first_point, second_figure: segment,
                                            result: first_point.intersect(segment))
      fourth_intersection = Intersection.new(first_figure: first_point, second_figure: rectangle,
                                             result: first_point.intersect(rectangle))

      fifth_intersection = Intersection.new(first_figure: third_point, second_figure: segment,
                                            result: third_point.intersect(third_point))
      six_intersection = Intersection.new(first_figure: third_point, second_figure: rectangle,
                                          result: third_point.intersect(rectangle))

      seventh_intersection = Intersection.new(first_figure: segment, second_figure: rectangle,
                                              result: segment.intersect(rectangle))

      intersection_service = described_class.new(figures)

      expect(intersection_service.result)
        .to include(first_intersection, second_intersection, third_intersection,
                    fourth_intersection, fifth_intersection, six_intersection, seventh_intersection)
      # 7 - uniq intersections
      expect(intersection_service.result.count).to eq(7)
    end
  end
end
