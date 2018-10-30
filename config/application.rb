require_relative 'boot'
#将ransack与simple_from结合
ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'
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
    # config.generators do |g|
    #   g.orm            				 false
    #   #不自动生成路由，自定义路由，添加国际化
    #   g.resource_route false
    #   #自定义模板
    #   g.template_engine				 :my_templates
    # end

    #设置编码格式
    config.encoding = "utf-8"

  end
end
