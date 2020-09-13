class Book < ApplicationRecord
  has_one :user

  has_paper_trail on: [:update], only: [:user_id]

  validates :title, :author, presence: true
end