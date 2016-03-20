class Petition < ActiveRecord::Base
  DAYS_TO_EXPIRE = 10
  SUCCESSFUL_VOTES_COUNT = 2
  validates :title, :text, :user_id, presence: true
  scope :expired, -> { where('created_at < ?', Time.now-DAYS_TO_EXPIRE.days) }

  belongs_to :user
  has_many :votes

  def successful_vote?
    self.votes.count >= SUCCESSFUL_VOTES_COUNT
  end

  def expired?
    self.created_at < Time.now-DAYS_TO_EXPIRE.days
  end

end
