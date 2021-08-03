class Book < ApplicationRecord
  
  belongs_to :user, optional: true
  
  validates :title, presence: true
  validates :body, length: { in:1..200 }
  
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
