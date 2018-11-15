class Item < ApplicationRecord
  belongs_to :stall
  has_many :comments
end
