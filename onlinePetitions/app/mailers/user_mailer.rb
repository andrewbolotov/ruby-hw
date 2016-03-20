class UserMailer < ApplicationMailer
  SUBJECTS = {
    succeed: "Ваша петиция набрала #{Petition::SUCCESSFUL_VOTES_COUNT} голосов",
    expired: "Ваша петиция не набрала #{Petition::SUCCESSFUL_VOTES_COUNT} голосов",
    admin_succeed: "Петиция набрала #{Petition::SUCCESSFUL_VOTES_COUNT} голосов"
  }
  ADMIN_EMAIL = 'rageful.spirit@gmail.com'

  def expired_petition_notice(user, petition)
    @user = user
    @petition = petition
    mail(to: @user.email, subject: SUBJECTS[:expired])
  end

  def succeed_petition_notice(user, petition)
    @user = user
    @petition = petition
    mail(to: @user.email, subject: SUBJECTS[:succeed])
  end

  def succeed_petition_admin_notice(petition)
    @petition = petition
    mail(to: ADMIN_EMAIL, subject: SUBJECTS[:admin_succeed])
  end

end
