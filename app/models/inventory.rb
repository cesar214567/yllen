class Inventory < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :item
  validates :inventory_type,presence: true, inclusion: { in: %w[ingreso salida equivocacion] }

end
