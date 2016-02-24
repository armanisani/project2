class LikesController < ApplicationController
  def create
    @art = Art.find(params[:id])

    @like = Like.new
    @like.user_id = current_user.id
    @like.art_id = @art.id

    if @like.save
      redirect_to show_user_path(@art)
    end
  end

  def destroy
  end
end
