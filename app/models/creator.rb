class Creator < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :creator_name
    validates :creator_text
  end
end
