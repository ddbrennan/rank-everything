class Thing < ActiveRecord::Base
  has_many :votes
  has_many :users, through: :votes

  def pct_rating
    total = self.votes.count
    good = self.votes.select {|vote| vote.good}.count
    total > 0 ? 100 * (good.to_f / total.to_f) : 0
  end

  def self.top_ten
    self.all.sort_by {|thing| thing.pct_rating}.reverse[0..9]
  end

end
