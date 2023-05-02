require 'rails'
require 'kaminari-activegraph'
require 'database_cleaner'

DatabaseCleaner[:neo4j, connection: {type: :server_db, path: "http://localhost:7475"}].strategy = :deletion

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
