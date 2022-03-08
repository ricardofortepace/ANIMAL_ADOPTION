class Animal < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy
  has_many_attached :photos
  validates :specie, :genre, :age, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_description,
    against: [:description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
