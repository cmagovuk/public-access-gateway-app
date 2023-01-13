class Business < ApplicationRecord

    belongs_to :submission
    
    validates :name, presence:true, length: { maximum: 255 }
    validates :street, length: { maximum: 255 }
    validates :townorcity, length: { maximum: 255 }
    validates :county, length: { maximum: 50 }
    validates :postcode, length: { maximum: 10 }
    validates :url, length: { maximum: 255 }
    
end
