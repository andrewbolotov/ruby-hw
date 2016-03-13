class Admin::HomeController < Admin::BaseController
  before_action :can_access?

  def index
    @created_last_week = Petition.where('created_at >= ?', 1.week.ago).count
    @new_petitions = Petition.where("state = 'new'").count
  end
end
