ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

# require('capybara/rspec') not required as specified in Gem file
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Brand.all.each() do |brand|
      brand.destroy()
    end
    Store.all.each() do |store|
      store.destroy()
    end
  end
end
