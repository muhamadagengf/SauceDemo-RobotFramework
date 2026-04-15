*** Settings ***
Library    SeleniumLibrary
Resource    ../src/pages/login.page.resource
Resource    ../src/pages/browser.resource

*** Test Cases ***
Login Berhasil
    Open Chrome Browser
    login dengan credential    ${valid-username}    ${valid-password}
    Page Should Contain    Products
    [Teardown]    Close Browser
    
Login dengan username salah
    Open Chrome Browser
    login dengan credential    userbogeng    ${valid-password}
    [Teardown]    Close Browser

Login dengan password salah
    Open Chrome Browser
    login dengan credential    ${valid-username}    salahpass
    [Teardown]    Close Browser

Login dengan username dan password salah
    Open Chrome Browser
    login dengan credential    salahuser    salah pass
    [Teardown]    Close Browser

Login dengan tidak mengisi username
    Open Chrome Browser
    login dengan credential    ${EMPTY}    ${valid-password}
    [Teardown]    Close Browser

Login dengan tidak mengisi password
    Open Chrome Browser
    login dengan credential    ${valid-username}    ${EMPTY}
    [Teardown]    Close Browser

Login dengan tidak mengisi username dan password
    Open Chrome Browser
    login dengan credential    ${EMPTY}    ${EMPTY}
    [Teardown]    Close Browser