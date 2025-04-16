*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Test Cases ***
login_test End-to-End Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=UserName    ${USERNAME}
    Input Password    id=Password    ${PASSWORD}
    Input Text    id=UserCaptchaCode    ${CAPTCHA_BYPASS}
    Click Button    id=btnLogins
    Wait Until Page Contains Element    id=UserManagement    timeout=20s
    Sleep    10s
    Close Browser
