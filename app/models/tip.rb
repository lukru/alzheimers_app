class Tip < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  scope :by_votes,  joins('left join votes on votes.tip_id = tips.id').
                    select('tips.*, count(votes.id) as votes_count').
                    group('tips.id').
                    order('votes_count desc')
end
