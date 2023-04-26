require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require_relative 'helper.rb'
require_relative 'page_helper.rb'

ENVIRONMENT = ENV['ENVIRONMENT']
puts "Ambiente >> #{ENVIRONMENT}"
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/environments/#{ENVIRONMENT}.yml")
World(Pages, Helper)

Capybara.configure do |config|
    case ENV['BROWSER'] #configuração para validar o navegador de execução do teste
        when 'chrome_headless'
            config.default_driver = :selenium_chrome_headless
        when 'chrome' 
            config.default_driver = :selenium_chrome
    end
    config.app_host = CONFIG['url_default']
    config.default_max_wait_time = 10   
end