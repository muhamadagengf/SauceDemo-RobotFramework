*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url_login}         https://www.saucedemo.com/
${browser}           chrome
${field-username}    id=user-name
${field-password}    id=password
${btn-login}         id=login-button
${valid-username}    standard_user
${valid-password}    secret_sauce

*** Keywords ***
# Open sauce demo
#     Open Browser    ${url_login}    ${browser}
#     Maximize Browser Window

    
login dengan credential
    [Arguments]    ${username}    ${password}
    Input Text    ${field-username}    ${username}
    Input Password    ${field-password}    ${password}
    Click Button    ${btn-login}
    