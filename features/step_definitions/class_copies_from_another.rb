Given(/^I have a MailingAddress model from a BillingInformation model$/) do
  @billing = BillingInformation.new
  @mailing = @billing.build_mailing_address street: 'just bounce',
                                            zip: '00844',
                                            state: 'awesome'
end

Given(/^I have specified a ShippingAddress model to be the same$/) do
  @shipping = @billing.build_shipping_address same_as_mailing_address: true
end

When(/^I save the BillingInformation model$/) do
  @billing.save!
end

Then(/^the ShippingAddress fields should reflect the MailingAddress$/) do
  @shipping.street.should == @mailing.street
  @shipping.zip.should == @mailing.zip
  @shipping.state.should == @mailing.state
end

