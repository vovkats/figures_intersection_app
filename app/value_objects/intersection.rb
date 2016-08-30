class Intersection
  attr_reader :first_figure, :second_figure, :result

  def initialize(first_figure:, second_figure:, result:)
    @first_figure = first_figure
    @second_figure = second_figure
    @result = result
  end

  def ==(other)
    (first_figure.class == other.first_figure.class &&
     first_figure == other.first_figure &&
     second_figure.class == other.second_figure.class &&
     second_figure == other.second_figure) ||
      ( first_figure.class == other.second_figure.class &&
        first_figure == other.second_figure &&
        second_figure.class == other.first_figure.class &&
        second_figure == other.first_figure )
  end
end