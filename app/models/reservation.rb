class Reservation < ApplicationRecord

    validates :start_date presence: true,
    validates :end_date presence: true,
    validates :peoples, presence: true,

    belongs_to :user
    belongs_to :room
end
