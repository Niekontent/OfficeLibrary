class Book < ApplicationRecord
  has_paper_trail on: [:update], only: [:user_id]

  validates :title, :author, presence: true

  has_one :user
end
