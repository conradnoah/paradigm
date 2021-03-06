class CommentsController < ApplicationController
before_action :authenticate_user!

  def create
    ProfanityChecker.swapProfanity(comment_params[:content])
    @post = Post.find(params[:post_id])
    @comment = Comment.create(params[:comment].permit(:content, :avatar))
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :avatar)
  end
end
