class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :events, class_name: 'Event', foreign_key: :owner_id, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader, dependent: :destroy

end
