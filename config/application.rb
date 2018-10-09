require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EbookPavilion
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #scaffold
    #orm：设置使用哪个 ORM。默认为 false，使用 Active Record。
    #template_engine：设置使用哪个模板引擎，例如 ERB 或 Haml，默认为 :erb。
    config.generators do |g|
      g.orm            				 false
      g.template_engine				 :my_templates
    end

    #设置国际化
    config.i18n.default_locale = 'zh-CN'

  end
end
