class PagesController < ApplicationController
  def home
    @dogs = Dog.all
  end
end
