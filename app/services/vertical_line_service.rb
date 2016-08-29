class VerticalLineService
  def self.form_vertical_lines(vertical_lines_params)
    return [] if vertical_lines_params.blank?

    vertical_lines = []
    vertical_lines_params[:a].count.times do |index|
      vertical_lines << VerticalLineFactory.build(a: vertical_lines_params[:a][index])
    end

    vertical_lines
  end
end
