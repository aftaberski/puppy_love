class Article < ActiveRecord::Base
  has_many :votes
  belongs_to :user
end
