class CommentsController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.spot = @spot
    if @comment.save
      redirect_to spot_path(@spot)
    else
      render "spots/show", status: :see_other
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
