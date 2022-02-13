class Room < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :creator
  has_many :messages
  has_one :estimate
end
