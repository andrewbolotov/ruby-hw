class Petition < ActiveRecord::Base
  validates :title, :text, :user_id, presence: true

  belongs_to :user
end
