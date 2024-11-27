require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "rails/test_unit/railtie"
require "ostruct"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RfiManagementInterface
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.assets.paths << Rails.root.join('node_modules/govuk-frontend/dist/govuk/assets')

    config.exceptions_app = routes

    # Load Govuk template set from "config/govuk_notify_templates.yml"
    config.govuk_notify_templates = config_for(
      :govuk_notify_templates, env: ENV.fetch("GOVUK_NOTIFY_ENV", "test")
    ).with_indifferent_access

    config.active_record.use_yaml_unsafe_load = true
            
    config.x.cookie_expiry = 1.year
    
    config.x.analytics_tracking_id = ENV['GA_TRACKING_ID']
    config.x.link_info_charter = ENV["LINK_INFO_CHARTER"]
    config.x.feedback_email = ENV["FEEDBACK_EMAIL"]
    config.x.maintenance_text = ENV["MAINTENANCE_TEXT"]
    config.x.link_start_page = ENV["LINK_START_PAGE"]
    config.x.test_message = ENV["TEST_MESSAGE"]
    
  end
end
