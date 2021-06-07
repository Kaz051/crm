class Customer < ApplicationRecord
  validates :name, presence: true
  has_many :estimates
  has_many :bookmarks, dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
