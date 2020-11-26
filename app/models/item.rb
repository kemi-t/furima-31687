class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :days_to_ship
  belongs_to :prefecture

  with_options presence: true do
    # ActiveStorageで使用することとしたimageについてもバリデーションはこのmodelに定義する
    validates :image
    validates :name
    validates :description
    # numericality:の引数によって様々な効果を適用させいる。デフォルトでpresence: tureの効果を保持している為、記述はしなくても良い。
      # only_integer: true　整数でのみ許可
      # greater_than_or_equal_to: ***　最小で***以上の数値から許可
      # less_than_or_equal_to: ***　最大で***以下の数値まで許可
    validates :price,     numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
end
