class PostImage < ApplicationRecord

belongs_to :user
attachment :image # ここを追加（_idは含めません）refileを使用するにはattachmentメソッドを追加する必要がある
has_many :post_comments, dependent: :destroy
has_many :favorites, dependent: :destroy

validates :shop_name, presence: true
validates :image, presence: true
# データが入っていればtrue,入っていなければfalseが返される

def favorited_by?(user)
    # いいねしたユーザーのidと照らし合わせて、仮の変数のようなものを置いて定義
    favorites.where(user_id: user.id).exists?
    # モデル名.where("条件") 
    # Postimage.favorites = テーブル これをfavoritesだけで記載している、has_many :favoritesで定義しているので
end
# favorited_by?メソッドを作成。引数で渡されたユーザidが
# Favoritesテーブル内に存在（exists?）するかどうかを調べる
# true falseで返す
end
