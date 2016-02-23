class HomesController < ApplicationController
  def index
    @arts = Art.all
  end

  def show
  end
end
