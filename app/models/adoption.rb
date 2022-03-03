class Adoption < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  validates :address, presence: true
end
