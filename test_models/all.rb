require 'active_record'

begin
  ActiveRecord::Base.connection
rescue ActiveRecord::ConnectionNotEstablished => _
  ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'db/test.sqlite3'
end

require 'test_models/address'
require 'test_models/mailing_address'
require 'test_models/shipping_address'
require 'test_models/billing_information'