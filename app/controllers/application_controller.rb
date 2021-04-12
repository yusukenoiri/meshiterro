class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  # 全てのコントローラーでアクション実行前に行われる
  # authenticate_userメソッドは、devise側が用意しているメソッド
  # :authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装
  # exceptは指定したアクションをbefore_actionの対象から外す。今回の場合homes#top。
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # （ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行される
  # devise_controller?とはdeviseを生成した際にできるヘルパーメソッドの一つ、deviseにまつわる画面に行った時に、
  # という意味,こうすることで全ての画面でconfigure_permitted_parametersが起動
  # devise_controller?というメソッドの返り値がtrueだったら、configure_permitted_parametersを呼ぶ
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  # Deviseでユーザーログイン後のリダイレクト先を変更
  
  protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
  # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定。
  # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可される。
  # CARAVAN作成時のStrong Parametersと同様の機能。privateは、自分のコントローラ内でしか参照できない。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # configure_permitted_parametersはdevise版のストロングパラメーター
  # deviseでは初期設定でメールアドレスとパスワードしか許されていない
  # ここを編集することでユーザーネームなどを入れることができる
  # 今回の例だとnameカラムへの保存を許可する
end
