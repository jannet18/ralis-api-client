require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ApiAuthentication
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_ony = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch:: Sessions::CookieStore
    config.action_dispatch.cookies_same_site_protection = :strict # ensures that cookies are only shared on the same domain
  end
end