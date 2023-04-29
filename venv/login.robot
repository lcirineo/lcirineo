*** Settings ***
Library     SeleniumLibrary
Resource    Resources/keyword.robot

*** Variables ***
${email}        lourdes100@test.com
${password}     Test123!
${username}     lourdestest
${keyword}      2022

*** Test Cases ***
User Successfully Loaded NewsPaper.com Page
    Given User Is In NewsPaper.com Page
    When User Clicks Signin Button
    Then Signin Form Is Displayed

User Successfully Logged In
    Given Signin Form Is Displayed
    When User Inputs Email      ${email}
    And User Inputs Password    ${password}
    And User Clicks Sign In With Newspapers.com Button
    Then User Should Be Redirected To Newspapers.com Homepage   ${username}

User Successfully Searched Article
    Given User Is In NewsPaper.com
    When User Inputs Keyword On Search Field    ${keyword}
    And Clicks Search Button
    Then User Should Be Redirected To Results Page

User Successfully Logged Out
    Given User Is In Results Page
    When User Clicks Profile Button
    And User Clicks Sign Out Button
    Then User Should Be Redirected To NewsPaper.com Page