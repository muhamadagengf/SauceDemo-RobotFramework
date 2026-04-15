*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Keywords ***
Open Chrome Clean
    ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()

    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    autofill.profile_enabled=${False}
    ...    autofill.credit_card_enabled=${False}

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --guest
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking

    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window

Close Browser Session
    Close Browser