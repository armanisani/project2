class HomesController < ApplicationController
  def index
    @relations = Relationship.all
    @arts = Art.all
  end

  def show
  end
end
