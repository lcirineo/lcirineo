*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
User Is In NewsPaper.com Page
    Open Browser                        https://www.newspapers.com/          chrome
    Maximize Browser Window
    Title Should Be                     Historical Newspapers from 1700s-2000s - Newspapers.com

User Clicks Signin Button
    Click Element                       id:signinlink

Signin Form Is Displayed
    Wait Until Element Is Visible       modal-SignInModal

User Inputs Email
    [Arguments]    ${email}
    Input Text                          username        ${email}

User Inputs Password
    [Arguments]    ${password}
    Input Text                          password        ${password}

User Clicks Sign In With Newspapers.com Button
    Click Element                       class:icon-n
    Wait Until Element Is Not Visible   id:signinlink

User Should Be Redirected To Newspapers.com Homepage
    [Arguments]    ${username}
    Wait Until Element Is Visible       id:globalMemNav
    Wait Until Element Contains         id:globalMemNav    ${username}
    Wait Until Element Is Visible       id:logo

User Is In NewsPaper.com
    Wait Until Element Is Visible       id:globalMemNav
    Wait Until Element Contains         id:globalMemNav    ${username}
    Wait Until Element Is Visible       id:logo

User Inputs Keyword On Search Field
    Set Focus To Element                id:keyword-input
    Element Should Be Focused           id:keyword-input
    [Arguments]    ${keyword}
    Input Text                          id:keyword-input   ${keyword}
    Element Should Not Contain          id:keyword-input   Add a keyword or name

Clicks Search Button
    Click Element                       class:btn-primary

User Should Be Redirected To Results Page
    Location Should Contain             /search/

User Is In Results Page
    Location Should Contain             /search/

User Clicks Profile Button
    Click Element                       id:globalMemNav
    Wait Until Element Is Visible       id:member-info

User Clicks Sign Out Button
    Click Element                       id:logout

User Should Be Redirected To NewsPaper.com Page
    Wait Until Element Is Not Visible   id:logout
    Element Should Be Visible           id:signinlink