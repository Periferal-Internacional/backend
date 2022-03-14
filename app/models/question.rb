class Question < ApplicationRecord
    attribute :answers, :string, array: true
end
