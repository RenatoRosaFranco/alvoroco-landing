require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Alvoroco
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

		LetterOpener.configure do |config|
		  # To overrider the location for message storage.
		  # Default value is <tt>tmp/letter_opener</tt>
		  config.location = Rails.root.join('tmp', 'my_mails')

		  # To render only the message body, without any metadata or extra containers or styling.
		  # Default value is <tt>:default</tt> that renders styled message with showing useful metadata.
		  config.message_template = :light
		end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
