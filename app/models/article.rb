class Article < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  validates_presence_of :title, :content
end
