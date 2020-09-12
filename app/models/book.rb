class Book < ApplicationRecord
  validates :title, :author, presence: true

  has_one :user
end
