class Item < ApplicationRecord
  belongs_to :subtype
  has_many_attached :images
  has_one :type, :through => :subtype
  has_many :reservations
  include PgSearch::Model
  pg_search_scope :general_search,
    against: [:name, :description],
    associated_against: {
      type:[:name],
      subtype: [:name]
    }, using: {
      tsearch: {prefix: true}
    }
  paginates_per 9

end
