# *** Settings ***
# Library    SeleniumLibrary

# *** Variables ***
# ${URL}    https://www.saucedemo.com/

# *** Keywords ***
# Open Chrome Clean
#     ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()

#     ${prefs}=    Create Dictionary
#     ...    credentials_enable_service=${False}
#     ...    profile.password_manager_enabled=${False}
#     ...    autofill.profile_enabled=${False}
#     ...    autofill.credit_card_enabled=${False}

#     Call Method    ${options}    add_experimental_option    prefs    ${prefs}
#     Call Method    ${options}    add_argument    --incognito
#     Call Method    ${options}    add_argument    --guest
#     Call Method    ${options}    add_argument    --disable-notifications
#     Call Method    ${options}    add_argument    --disable-popup-blocking

#     Create Webdriver    Chrome    options=${options}
#     Go To    ${URL}
#     Maximize Browser Window

# Close Browser Session
#     Close Browser
*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Chrome Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    ${headless}=    Set Variable    --headless
    ${no_sandbox}=    Set Variable    --no-sandbox
    ${disable_dev_shm}=    Set Variable    --disable-dev-shm-usage
    ${window_size}=    Set Variable    --window-size=1920,1080
    ${incognito}=    Set Variable    --incognito
    ${disable_notifications}=    Set Variable    --disable-notifications

    Call Method    ${chrome_options}    add_argument    ${headless}
    Call Method    ${chrome_options}    add_argument    ${no_sandbox}
    Call Method    ${chrome_options}    add_argument    ${disable_dev_shm}
    Call Method    ${chrome_options}    add_argument    ${window_size}
    Call Method    ${chrome_options}    add_argument    ${incognito}
    Call Method    ${chrome_options}    add_argument    ${disable_notifications}

    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}

    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}

    Open Browser    https://www.saucedemo.com    chrome    options=${chrome_options}