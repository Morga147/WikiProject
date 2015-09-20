class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
