class Event < ApplicationRecord
  has_many :participations
  belongs_to :owner, class_name: 'User'

  include ActiveModel::Validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 250 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates_with EventValidator

  # current_userがすでに参加しているかどうかのメソッド
  def participated_by?(user)
      participations.where(user_id: user.id).exists?
  end

  # 検索
  def self.search(input)
      return Event.where('start_time > ?', Time.zone.now).order(:start_time) if input.blank?
      Event.where('name LIKE(?)', "%#{input}%").where('start_time > ?', Time.zone.now).order(:start_time)
  end 

end
