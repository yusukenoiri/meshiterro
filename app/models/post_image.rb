class PostImage < ApplicationRecord

belongs_to :user
attachment :image # ここを追加（_idは含めません）
has_many :post_comments, dependent: :destroy
has_many :favorites, dependent: :destroy

def favorited_by?(user)
    # いいねしたユーザーのidと照らし合わせて、仮の変数のようなものを置いて定義
    favorites.where(user_id: user.id).exists?
end
# favorited_by?メソッドを作成。引数で渡されたユーザidが
# Favoritesテーブル内に存在（exists?）するかどうかを調べる
# true falseで返す
end
