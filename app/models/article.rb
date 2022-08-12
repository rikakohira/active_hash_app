class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  # 空の投稿を保存できないようにする
  validates :title, :text, presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  # genre_idのid:1以外のときに保存できる
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
end
