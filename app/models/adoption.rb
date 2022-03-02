class Adoption < ApplicationRecord
  belongs_to :animal, :user
  validates :address, presence: true
end
