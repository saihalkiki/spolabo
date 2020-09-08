class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.search(input)
    return Event.where('start_time > ?', Time.zone.now).order(:start_time) if input.blank?
    Event.where('name LIKE(?)', "%#{input}%").where('start_time > ?', Time.zone.now).order(:start_time)
  end 
end
