class Order < ApplicationRecord
    belongs_to :user
    has_many :user_books, dependent: :destroy
    has_many :books, through: :user_books
  end