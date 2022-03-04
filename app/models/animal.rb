class Animal < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy
  has_many_attached :photos
  validates :specie, :genre, :age, presence: true
end
