class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"  
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
  
  def show
    @comment.update( status: 0)
    comment = Comment.new
    comments = @tweet.comments.includes(comments_id: params[:id], user_id: current_user.id)

    comment.save

  end

end
