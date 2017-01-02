class Post < ApplicationRecord
	belongs_to :user
	validates :subject, presence: true, length: { minimum: 1, maximum: 50 }
	validates :body, presence: true, length: { minimum: 1, maximum: 2000 }
end
