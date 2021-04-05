Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  # ルートパスでtop画面へ遷移できるように設定
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  # 不要なルーティングが実行されないようにonlyを設定
  # post_imagesの中にpost_comments,親子関係
  end
  
end
