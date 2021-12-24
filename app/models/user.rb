class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations
  validates :name, :last_name,presence: true

  def full_name
    "#{name} #{last_name}".split.map(&:capitalize).join(' ')
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
