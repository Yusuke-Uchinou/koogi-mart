class Creator < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :creator_name
    validates :creator_text
  end
end
