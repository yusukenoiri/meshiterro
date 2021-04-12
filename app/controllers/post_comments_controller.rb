class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    # comment = current_user.post_comments.new(post_comment_params)
    # 上記は以下と同義。これわからんw
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    # id: params[:id] = post_commentのidを調べている。
    # route = post_images/:post_image_id/post_comments/:id(.:format) 
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
    # permitは保存・更新したい内容についてフィルターする
  end

end
