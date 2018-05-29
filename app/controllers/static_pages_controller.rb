class StaticPagesController < ApplicationController
  def home
    @reports = Report.paginate(page: params[:page])
  end
end
