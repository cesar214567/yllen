class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :general_search,
    against: [:name, :last_name,:phone_number],
    associated_against: {
      item:[:name]
    }, using: {
      tsearch: {prefix: true}
    }

end
