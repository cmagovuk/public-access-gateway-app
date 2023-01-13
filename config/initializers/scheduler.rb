require "rufus-scheduler"

# do not schedule when Rails is run from its console, for a test/spec, or from a Rake task
return if defined?(Rails::Console) || Rails.env.test? || File.split($PROGRAM_NAME).last == "rake"

scheduler = Rufus::Scheduler.singleton

scheduler.every "3h" do
  Rails.logger.info "Purging old issues"
  Rails.logger.info "Before purge count #{Submission.count}"
  Submission.Purge!(30.days.ago)
  Rails.logger.info "After purge #{Submission.count}"
  Rails.logger.flush
end