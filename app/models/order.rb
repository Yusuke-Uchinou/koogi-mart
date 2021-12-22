class Order < ApplicationRecord
  belongs_to :creator
  has_one_attached :main_order_image
  has_many_attached :order_images

  with_options presence: true do
    validates :order_name
    validates :order_text
    validates :order_price_min
    validates :order_price_max
    validates :genre_id
    validates :day_min
    validates :day_max
    validates :main_order_image
  end
  validates :order_price_min, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: :order_price_max, message: 'is out of setting range'}
  validates :order_price_max, numericality: { only_integer: true, greater_than_or_equal_to: :order_price_min, less_than_or_equal_to: 9_999_999, message: 'is out of setting range'}
  validates :day_min, numericality: { only_integer: true, greater_than: 1,less_than_or_equal_to: :day_max, message: 'is out of setting range' }
  validates :day_max, numericality: { only_integer: true, greater_than_or_equal_to: :day_min, message: 'is out of setting range' }
end
