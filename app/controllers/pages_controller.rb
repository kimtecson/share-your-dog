class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

    if params[:query].present?
      @dogs = Dog.search_by(params[:query])
    else
      @dogs = Dog.all
    end
  end
end
