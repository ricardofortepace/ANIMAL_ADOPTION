class Animal < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy
  has_many_attached :photos
  validates :specie, :genre, :age, :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
