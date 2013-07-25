Given(/^I have a MailingAddress model from billing info$/) do
  @billing = BillingInfo.new
  @mailing = @billing.build_mailing_address address: 'just bounce',
                                            zip: '00844',
                                            state: 'awesome'
end

Given(/^I have specified a ShippingAddress model to be the same$/) do |arg1|
  @shiping = @billing.build_shipping_address same_as_mailing: true
end

When(/^I save the ShippingAddress model$/) do |arg1|
  @shiping.save!
end

Then(/^the ShippingAddress fields should reflect the MailingAddress$/) do |arg1, arg2|
  @shiping.address.should == @mailing.address
  @shiping.zip.should == @mailing.zip
  @shiping.state.should == @mailing.state
end

