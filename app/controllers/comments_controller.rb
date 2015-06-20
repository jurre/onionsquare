class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    Comment.create(comment_params)
    Pusher[@product.pusher_channel].trigger('comment', @product.comments_json)
    render json: @product.comments_json
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(
      user_id: current_user.id,
      product_id: @product.id
    )
  end
end
