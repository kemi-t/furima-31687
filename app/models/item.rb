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
    validates :price,     numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
end
