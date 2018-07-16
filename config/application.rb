require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FormBuilder
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    if Rails.env.development? || Rails.env.test?
      console do
        require 'pry'
        require 'awesome_print'
        require 'interactive_editor'

        config.console = Pry
        TOPLEVEL_BINDING.eval('self').extend ::Rails::ConsoleMethods
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
