class Event < ApplicationRecord

  belongs_to :owner, class_name: 'User'

  include ActiveModel::Validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 250 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates_with EventValidator
end
