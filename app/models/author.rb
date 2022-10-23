class Author < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :email, uniqueness: true
end
