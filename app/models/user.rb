class User < ActiveRecord::Base
  has_many :tips
  has_many :comments
  has_many :votes
end
