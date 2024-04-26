class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :user
  before_validation :set_defaults
  include PgSearch::Model
  pg_search_scope :general_search,
    against: [:name, :last_name,:phone_number],
    associated_against: {
      item:[:name]
    }, using: {
      tsearch: {prefix: true}
    }
  
    private

    def set_defaults
      enabled = true
      answered = false
    end
end
