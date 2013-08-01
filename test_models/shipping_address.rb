class ShippingAddress < Address

  include SameAs

  same_as :mailing_address, :from => :addressable

end