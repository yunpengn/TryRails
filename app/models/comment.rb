class Comment < ApplicationRecord
	# comment is assoicated to article, it belongs to a certain article.
	# Each comment belogns to one article, one article can have many comments.
  	belongs_to :article

  	validates :user, presence: true
end
