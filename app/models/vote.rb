class Vote < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :tip}
  belongs_to :tip
  belongs_to :user
end
