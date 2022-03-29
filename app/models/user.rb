class User < ApplicationRecord
    belongs_to :plant
    has_many :documentations, dependent: :destroy
    has_many :deliverables, dependent: :destroy

    public
        def getPlant()
            return Plant.find(self.plant_id)
        end
end
