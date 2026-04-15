*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${add-saucelabsbackpack}    id=add-to-cart-sauce-labs-backpack
${add-onesie}    name=add-to-cart-sauce-labs-onesie
${btn-checkout}    id=checkout
${field-first_name}    id=first-name
${field-last_name}    id=last-name
${field-zip}    id=postal-code
${btn-continue}    id=continue
${btn-finish}    id=finish
${cart-icon}    class=shopping_cart_link

*** Keywords ***
add product
    Wait Until Element Is Visible    ${add-saucelabsbackpack}    10s
    Click Element                    ${add-saucelabsbackpack}
    Wait Until Element Is Visible    css=.shopping_cart_badge    10s
    Click Element    ${cart-icon}
    # Press Keys    None    ENTER
    # Sleep    5s
    Wait Until Element Is Visible    ${btn-checkout}    10s
    Click Button    ${btn-checkout}

fill checkout information
    [Arguments]    ${fname}    ${lname}    ${zip}
    Sleep    10s
    Wait Until Element Is Visible    ${field-first_name}    100s 

    Input Text      ${field-first_name}    ${fname} 
    Input Text      ${field-last_name}     ${lname} 
    Input Text      ${field-zip}           ${zip} 
    
    Click Button    ${btn-continue}

Checkout
    Sleep    2
    Wait Until Page Contains    Checkout: Overview
    Wait Until Element Is Enabled    ${btn-finish}
    Click Element    ${btn-finish}
