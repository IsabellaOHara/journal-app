class Entry < ApplicationRecord
    has_many :taggables, dependent: :destroy
    has_many :tags, through: :taggables
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "group", "id", "link", "name", "notes", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
