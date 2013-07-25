class BillingInformation < ActiveRecord::Base

  has_one :mailing_address,
          :class_name => 'MailingAddress',
          :as => :addressable

  has_one :shipping_address,
          :class_name => 'ShippingAddress',
          :as => :addressable

end