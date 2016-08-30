class FiguresController < ApplicationController
  def index
  end

  def new
    render json: {
      html: render_to_string(
        partial: "figures/form_fields/#{params[:figure]}_fields",
        formats: [:html], layout: false
      )
    }
  end

  def intersect
    if params[:figures]
      intersection_service = IntersectionService.new(figures: params[:figures])
      @intersections = intersection_service.result
      render 'intersect'
    else
      flash[:danger] = 'Form contains errors'
      redirect_to figures_path
    end
  rescue FiguresIntersection::BaseFigure::ValidateError, FactoryException
    flash[:danger] = 'Form contains errors'
    redirect_to root_path
  end
end
