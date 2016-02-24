class ArtsController < ApplicationController
  before_action :authorize, only: [:new]

  def index
    @arts = Art.all
    @art = Art.where("title like ?", "Neueve")
  end

  def show
    @art = Art.find(params[:id])
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    if @art.update_attributes(art_params)
      redirect_to art_index_path
    else
      render :edit
    end
  end

  def create
    @art = current_user.arts.new(art_params)
    if @art.save
      redirect_to art_index_path
    end
  end

  def new
    @art = Art.new
  end

  def delete
    @art = Art.find(params[:id])
    if current_user != @art.user
      redirect_to art_index_path
    else
      @art.destroy
      redirect_to art_path
    end
  end
  private
  def art_params
    params.require(:art).permit(:name, :style, :price, :details, :avatar)
  end
end
