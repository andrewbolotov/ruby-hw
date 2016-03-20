class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform
    @expired_petitions = Petition.expired
    @expired_petitions.each do |petition|
      if petition.successful_vote?
        UserMailer.succeed_petition_notice(petition.user, petition).deliver_later
        UserMailer.succeed_petition_admin_notice(petition).deliver_later
      else
        UserMailer.expired_petition_notice(petition.user, petition).deliver_later
      end
    end
  end
end
