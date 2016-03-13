class Vote < ActiveRecord::Base
  validates :petition_id, :user_id, uniqueness: { :scope => [:petition_id, :user_id] }

  belongs_to :user
end
