Feature: Vendor bids on a sealed-bid auction
  As a vendor
  I want to be able to bid on sealed-bid auctions
  So I can build software if I win

  Scenario: viewing the rules page
    Given there is a sealed-bid auction
    When I visit the home page
    Then I should see that the auction is Sealed-bid

    When I click on the auction's title
    Then I should see the rules for Sealed-bid auctions

  Scenario: bidding on a sealed-bid auction
    Given there is a sealed-bid auction
    And I am an authenticated vendor
    When I visit the home page
    Then I should not see "Current bid:"

    When I click on the auction's title
    Then I should be on the auction page
    And I should not see "Your bid:"
    And I should see "Current bid:"
    And I should see the bid form
    And I should see the maximum bid amount in the bidding form

    When I submit a bid for $3493
    Then I should see a confirmation for $3493

    When I click on the "Confirm" button
    Then I should see "Your bid: $3,493.00"

    When I visit the auction page
    Then I should not see the bid form
    And I should see "Your bid: $3,493.00"

  Scenario: viewing your own bid
    Given there is a sealed-bid auction
    And I am an authenticated vendor
    When I visit the auction page

    When I submit a bid for $500
    Then I should be on the bid confirmation page
    And I should see a confirmation for $500

    When I click on the "Confirm" button
    Then I should see "Your bid: $500"

    When I visit the auction page
    And I click on the "Bids" link
    Then I should see "$500"
    And I should not see "$500 *"
    And I should not see bids from other users
