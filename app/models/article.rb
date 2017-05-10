class Article < ApplicationRecord
	# One article can have many comments.
	# When an article is deleted, all comments of this article is destroyed as well.
	has_many :comments, dependent: :destroy

	validates :title, presence: true,
					  length: {minimum: 3}
end
