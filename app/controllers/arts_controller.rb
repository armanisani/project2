class ArtsController < ApplicationController

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
    if @art.update_attributes(params.require(:art).permit(:artname))
      redirect_to art_index_path
    else
      render :edit
    end
  end

  def create
    @art = current_user.art.new(art_params)
    if @art.save
      redirect_to art_path
    end
  end

  def new
    @art = Art.new
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy
    redirect_to art_path
  end
  private
  def art_params
    params.require(:art).permit(:name, :style, :price, :details, :avatar)
  end
end
