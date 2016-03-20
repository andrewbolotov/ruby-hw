class Vote < ActiveRecord::Base
  validates :petition_id, :user_id, uniqueness: { :scope => [:petition_id, :user_id] }
  validate :petition_cannot_be_expired, on: :create


  belongs_to :user
  belongs_to :petition

  def petition_cannot_be_expired
    errors.add(:expired, "Нельзя голосовать за просроченную петицию") if self.petition.expired?
  end

end
