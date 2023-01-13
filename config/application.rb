require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"
# added for rails 6.1
require "active_support/core_ext/integer/time"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GovukCmaPublicGateway
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.exceptions_app = routes

    config.middleware.use Rack::Deflater

    # Load Govuk template set from "config/govuk_notify_templates.yml"
    config.govuk_notify_templates = config_for(
      :govuk_notify_templates, env: ENV.fetch("GOVUK_NOTIFY_ENV", "test")
    ).with_indifferent_access

    config.x.cookie_expiry = 1.year

    config.x.analytics_tracking_id = ENV['GA_TRACKING_ID']
    config.x.link_info_charter = ENV["LINK_INFO_CHARTER"]
    config.x.feedback_email = ENV["FEEDBACK_EMAIL"]
    config.x.maintenance_text = ENV["MAINTENANCE_TEXT"]
    config.x.link_start_page = ENV["LINK_START_PAGE"]
  end
end
