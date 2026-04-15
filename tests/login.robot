*** Settings ***
Library    SeleniumLibrary
Resource    ../src/pages/login.page.resource

*** Test Cases ***
Login Berhasil
    open sauce demo
    login dengan credential    ${valid-username}    ${valid-password}
    Page Should Contain    Products
    [Teardown]    Close Browser
    
Login dengan username salah
    open sauce demo
    login dengan credential    userbogeng    ${valid-password}
    [Teardown]    Close Browser

Login dengan password salah
    Open sauce demo
    login dengan credential    ${valid-username}    salahpass
    [Teardown]    Close Browser

Login dengan username dan password salah
    Open sauce demo
    login dengan credential    salahuser    salah pass
    [Teardown]    Close Browser

Login dengan tidak mengisi username
    Open sauce demo
    login dengan credential    ${EMPTY}    ${valid-password}
    [Teardown]    Close Browser

Login dengan tidak mengisi password
    Open sauce demo
    login dengan credential    ${valid-username}    ${EMPTY}
    [Teardown]    Close Browser

Login dengan tidak mengisi username dan password
    Open sauce demo
    login dengan credential    ${EMPTY}    ${EMPTY}
    [Teardown]    Close Browser