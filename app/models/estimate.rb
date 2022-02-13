class Estimate < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :estimate_image
end
