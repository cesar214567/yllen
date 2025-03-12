class Type < ApplicationRecord
  has_many :subtypes, dependent: :destroy
  has_one_attached :image

  include PgSearch::Model
  pg_search_scope :general_search,
    against: [:name, :description],
    associated_against: {
      subtypes:[:name]
    }, using: {
      tsearch: {prefix: true}
    }
end
