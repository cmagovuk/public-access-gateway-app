class Business < ApplicationRecord

    belongs_to :submission
    
    POSTCODE_REGEX = /\A([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})\z/.freeze
    
    validates :name, presence:true, length: { maximum: 255 }
    validates :street, length: { maximum: 255 }
    validates :townorcity, length: { maximum: 255 }
    validates :county, length: { maximum: 50 }
    validates :postcode, length: { maximum: 10 }, format: { with: POSTCODE_REGEX }, allow_blank: true
    validates :url, length: { maximum: 255 }
    

    
end
