class Room < ApplicationRecord
  has_many :users
  belongs_to :order
  has_many :messages
end
