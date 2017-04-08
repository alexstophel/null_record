require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "pry"
require "null_record"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "test.sqlite3",
)

RSpec.configure do |config|
  config.before(:all) do
    ActiveRecord::Base.send(:include, NullRecord)
  end

  config.before(:each) do
    ActiveRecord::Base.connection.execute <<-SQL
      DROP TABLE IF EXISTS users;
    SQL

    ActiveRecord::Base.connection.execute <<-SQL
      CREATE TABLE users (id INTEGER PRIMARY KEY);
    SQL
  end
end
