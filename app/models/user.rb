class User < ApplicationRecord
    has_secure_password
    belongs_to :plant
    has_many :documentations, dependent: :destroy
    has_many :deliverables, dependent: :destroy

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    public
        def getPlant()
            return Plant.find(self.plant_id)
        end
end
