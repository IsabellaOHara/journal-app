class Journal < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "day", "description", "id", "month", "title", "updated_at", "year"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["created_at", "day", "description", "id", "month", "title", "updated_at", "year"]
      end
end
