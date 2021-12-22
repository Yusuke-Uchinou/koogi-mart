class Order < ApplicationRecord
  belongs_to :creator

  with_options presence: true do
    validates :order_name
    validates :order_text
    validates :order_price_min
    validates :order_price_max
    validates :genre_id
    validates :day_min
    validates :day_max
  end
  validates :order_price_min, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: :order_price_max}
  validates :order_price_max, numericality: { only_integer: true, greater_than_or_equal_to: :order_price_min, less_than_or_equal_to: 9_999_999}
  validates :day_min, numericality: { only_integer: true, greater_than: 1,less_than_or_equal_to: :day_max }
  validates :day_max, numericality: { only_integer: true, greater_than_or_equal_to: :day_min }
end
