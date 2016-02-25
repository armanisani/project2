class LikesController < ApplicationController
  def create
    @art = Art.find(params[:id])

    @like = Like.new
    @like.user_id = current_user.id
    @like.art_id = @art.id

    if @like.save
      redirect_to(:back)
    end
  end

  def destroy
    @art= Art.find(params[:id])
  @like = Like.find_by art: @art.id, user_id: current_user.id
  if @like.destroy
    redirect_to(:back)
  end
end
end
