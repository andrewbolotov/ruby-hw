class Admin::BaseController < ApplicationController
  protected

  def can_access?
    fail "Вы не администратор!" unless current_user.admin?
  end
end
