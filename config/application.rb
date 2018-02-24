require_relative 'boot'

require 'rails'

%w(
  active_record/railtie
  action_cable/engine
  action_controller/railtie
  action_mailer/railtie
  action_view/railtie
).each do |framework|
  begin
    require framework
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trivia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
