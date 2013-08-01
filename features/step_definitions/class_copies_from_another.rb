Given(/^I have a MailingAddress model from billing info$/) do
  @billing = BillingInformation.new
  @mailing = @billing.build_mailing_address street: 'just bounce',
                                            zip: '00844',
                                            state: 'awesome'
end

Given(/^I have specified a ShippingAddress model to be the same$/) do
  @shipping = @billing.build_shipping_address same_as_mailing_address: true
end

When(/^I save the ShippingAddress model$/) do
  @shipping.save!
end

Then(/^the ShippingAddress fields should reflect the MailingAddress$/) do
  @shipping.street.should == @mailing.street
  @shipping.zip.should == @mailing.zip
  @shipping.state.should == @mailing.state
end

