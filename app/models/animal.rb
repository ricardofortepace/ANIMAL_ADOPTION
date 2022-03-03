class Animal < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy
  has_one_attached :photo

  validates :specie, :genre, :age, presence: true
end
