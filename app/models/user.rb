class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # deviseの後ろに :（コロン）で始まる部分がdeviseの機能名
  # :database_authenticatable（パスワードの正確性を検証）
  # :registerable（ユーザ登録や編集、削除）
  # :recoverable（パスワードをリセット）
  # :rememberable（ログイン情報を保存）
  # :validatable（emailのフォーマットなどのバリデーション）
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
