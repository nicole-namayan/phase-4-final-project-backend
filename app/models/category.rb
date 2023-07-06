class Category < ApplicationRecord
    has_many :books

    validates :genre, :description, presence: true
end