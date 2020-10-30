@findTransaction @test
Feature: Find Transactions in Account Activity

  Background:
    Given the user is logged in
    Then the user click the "Account Activity" tab
    Given the user accesses the "Find Transactions" tab
@wip
  Scenario: Search date range
    When the user enters date range	from "2012-09-01" to "2012-09-06"
    And clicks search
    Then results table should only show	transactions dates between "2012-09-01"	to "2012-09-06"
    And the	results	should be sorted by	most recent date
    When the user enters date range	from "2012-09-02" to "2012-09-06"
    And clicks search
    Then results table should only show	transactions dates between "2012-09-02"	to "2012-09-06"
    And the	results	table should only not contain transactions dated "2012-09-01"

  Scenario: Search description
    When the user enters description "ONLINE"
    And clicks search
    Then results table should only show descriptions containing "ONLINE"
    When the user enters description "OFFICE"
    And clicks search
    Then results table should only show descriptions containing "OFFICE"
    But results table should not show descriptions containing "OFFICE"


  Scenario: Search description case insensitive
    When the user enters description "ONLINE"
    And clicks search
    Then results table should only show descriptions containing "ONLINE"
    When the user enters description "ONLINE"
    And clicks search
    #In the following step there is a bug
    Then results table should only show descriptions containing "ONLINE"

  Scenario: Type
    And clicks search
    Then results table should show at least one result under Deposit
    Then results table should show at least one result under Withdrawal
    When user selects type "Deposit"
    And clicks search
    Then results table should show at least one result under Deposit
    But results table should show no result under Withdrawal
    When user selects type "Withdrawal"
    And clicks search
    Then results table should show at least one result under Withdrawal
    But results table should show no result under Deposit









