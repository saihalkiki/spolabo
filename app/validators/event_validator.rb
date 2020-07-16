class EventValidator < ActiveModel::Validator
  def validate(record)
    if record.start_time >= record.end_time
      record.errors.add(:start_time, "は終了時間より前に設定してください")
    end
  end
end