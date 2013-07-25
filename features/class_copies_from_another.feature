# language en

Feature: Class Copies From Another
  A model can be given the solution to copy
  it's fields from another model instead of
  taking in data given to it

  Scenario: Model updates from a different model's data
    Given I have a MailingAddress model from billing info
    And I have specified a ShippingAddress model to be the same
    When I save the ShippingAddress model
    Then the ShippingAddress fields should reflect the MailingAddress
