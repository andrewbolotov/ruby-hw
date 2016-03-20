namespace :petitions do
  desc 'Check for expired petitions'
  task expired: :environment do
    VotingEndingJob.new.perform
  end
end