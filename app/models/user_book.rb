class UserBook < ApplicationRecord
    belongs_to :book
    belongs_to :user


    validates :user_id, presence: true
    validates :book_id, presence: true, uniqueness: { scope: :user_id }


end