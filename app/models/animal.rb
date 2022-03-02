class Animal < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy

  validates :specie, :genre, :age, presence: true
end
