class Plant < ApplicationRecord
    has_many :users, dependent: :destroy
end
