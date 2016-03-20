class Petition < ActiveRecord::Base
  validates :title, :text, :user_id, presence: true

  belongs_to :user
  has_many :votes
end
