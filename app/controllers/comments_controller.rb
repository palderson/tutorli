class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(params[:comment])
    @comment.save
    
    redirect_to @blog
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy  
    
    redirect_to @comment.blog
  end
end
