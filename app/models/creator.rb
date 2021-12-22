class Creator < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :orders

  with_options presence: true do
    validates :creator_name
    validates :creator_text
  end
end
