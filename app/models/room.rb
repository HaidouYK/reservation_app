class Room < ApplicationRecord

    validates :room_name, presence: true
    validates :room_profile, presence: true
    validates :room_price, presence: true
    validates :room_address, presence: true
    validates_associated :room_image, presence: true

    belongs_to :user
    has_many :reservations
    has_one_attached :room_image

    def self.search_area(search)
        if search
            Room.where(['room_address LIKE ?', "%#{search}%"])
        else
            Room.none
        end
    end

    def self.search_keyword(search)
        if search
            Room.where(['room_name LIKE ?', "%#{search}%"]).or(Room.where(['room_address LIKE ?', "%#{search}%"])).or(Room.where(['room_profile LIKE ?', "%#{search}%"]))
            Room.none
        end
    end
end
