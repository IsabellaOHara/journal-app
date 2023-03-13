class Tag < ApplicationRecord
    has_many :taggables, dependent: :destroy
    has_many :entries, through: :taggables
end
