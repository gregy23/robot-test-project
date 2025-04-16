*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem


*** Variables ***
${URL}               https://sysdevintegral360staging.sscgi.com/
${USERNAME}          admingreg
${PASSWORD}          P@ssw0rd
${CAPTCHA_BYPASS}    CaptchaBypass

*** Test Cases ***
login_test End-to-End Test
    Open Browser    ${URL}    edge
    Maximize Browser Window
    Input Text    id=UserName    ${USERNAME}
    Input Password    id=Password    ${PASSWORD}
    Input Text    id=UserCaptchaCode    ${CAPTCHA_BYPASS}
    Click Button    id=btnLogins
    Wait Until Page Contains Element    id=UserManagement    timeout=20s
    Sleep    10s
    Close Browser
