*** Settings ***
Library       SeleniumLibrary
Resource      ../src/pages/checkout.page.resource
Resource      ../src/pages/login.page.resource
Resource      ../src/pages/browser.resource
# Test Setup    Setup and Login
Test Teardown    Close Browser

# *** Keywords ***
# Setup and Login
#     open sauce demo
#     login dengan credential    ${valid-username}    ${valid-password}
#     add product

*** Test Cases ***
user checkout sampai berhasil
    Open Chrome Clean
    login dengan credential    ${valid-username}    ${valid-password}
    add product
    fill checkout information    ageng    cobain    2323
    Checkout