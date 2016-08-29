class StraightLineService
  def self.form_straight_lines(straight_lines_params)
    return [] if straight_lines_params.blank?

    straight_lines = []
    straight_lines_params[:k].count.times do |index|
      straight_lines << StraightLineFactory.build(k: straight_lines_params[:k][index],
                                                  b: straight_lines_params[:b][index])
    end

    straight_lines
  end
end
