class FiguresController < ApplicationController

  def index

  end

  def new
    render json: {
      html: render_to_string(
        partial: "figures/#{params[:figure]}",
        formats: [:html], layout: false
      )
    }
  end

  def compare
    render text: 'test'
  end
end