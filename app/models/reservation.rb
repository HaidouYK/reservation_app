class Reservation < ApplicationRecord

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :peoples, presence: true, numericality: true
    validates :sum_price, numericality: true
    validate :start_end_check
    validate :start_today_check
    validate :end_today_check

    belongs_to :user
    belongs_to :room

    def start_end_check
        return if start_date.blank? || end_date.blank?
            errors.add(:start_date, "は終了日より前にしてください") if start_date > end_date
    end

    def start_today_check
        return if start_date.blank?
            errors.add(:start_date, "は今日以降の日付で選択してください") if start_date < Date.today
    end

    def end_today_check
        return if end_date.blank?
            errors.add(:end_date, "は今日以降の日付で選択してください") if end_date < Date.today
    end
end
