class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_many :events, class_name: 'Event', foreign_key: :owner_id, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :join_events, through: :participations, source: :event
  has_many :sns_credentials
  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader, dependent: :destroy

end
