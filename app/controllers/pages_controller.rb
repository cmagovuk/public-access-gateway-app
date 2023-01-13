class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  rescue StandardError
    render "/errors/not_found", status: :not_found
  end
end
