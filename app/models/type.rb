class Type < ApplicationRecord
  has_many :subtypes
  has_one_attached :image

  include PgSearch::Model
  pg_search_scope :general_search,
    against: [:name, :description,:type],
    associated_against: {
      type:[:name]
    }, using: {
      tsearch: {prefix: true}
    }
end
