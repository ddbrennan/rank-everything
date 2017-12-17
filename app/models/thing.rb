class Thing < ActiveRecord::Base
  validates :name, :presence => true, :length => {:maximum => 75}
  VALID_IMAGE_REGEX = /[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?(png|jpg)/
  validates :image_url, presence: true, format: { with: VALID_IMAGE_REGEX }

  has_many :votes
  has_many :users, through: :votes

  def pct_rating
    total = self.votes.count
    good = self.votes.select {|vote| vote.good}.count
    total > 0 ? (100 * (good.to_f / total.to_f)).round(2) : 0
  end

  def self.top_ten
    self.all.sort_by {|thing| thing.pct_rating}.reverse[0..9]
  end

end
