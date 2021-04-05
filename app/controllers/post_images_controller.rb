class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    # インスタンス変数に空のインスタンスを渡す
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
    # 投稿データを保存するアクションメソッド(POST)
    # 投稿データを保存するには、Strong Parametersも必要
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    # 1ページ分の決められた数のデータだけを、新しい順に取得
    # ページに表示させる件数の設定は、config/initializersのkaminari_config.rbファイルに記述
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
    # フォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェック
  end
  
end
