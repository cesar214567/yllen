class Subtype < ApplicationRecord
  belongs_to :type
  has_one_attached :image

  has_many :items, dependent: :destroy
  has_many :reservations, through: :items
  include PgSearch::Model
  pg_search_scope :general_search,
    against: [:name, :description],
    associated_against: {
      type:[:name]
    }, using: {
      tsearch: {prefix: true}
    }
end
