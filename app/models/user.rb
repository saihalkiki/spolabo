class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :events, class_name: 'Event', foreign_key: :owner_id
  has_many :participations
  validates :name, presence: true, uniqueness: true

end
