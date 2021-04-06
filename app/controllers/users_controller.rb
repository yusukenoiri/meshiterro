class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
    # ページメソッドでページを取ってくる
    
    # kaminariを導入すると、モデルクラスにpageメソッドが定義される。
    # このメソッドは、ページネーションにおけるページ数を指定。
    # ビューのリクエストの際paramsの中にpageというキーが追加されて、
    # その値がビューで指定したページ番号となる。pageの引数はparams[:page]となる。
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
