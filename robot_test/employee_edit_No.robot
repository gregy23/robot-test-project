*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${URL}               https://sysdevintegral360dev.sscgi.com/
${USERNAME}          admingreg
${PASSWORD}          P@ssw0rd
${CAPTCHA_BYPASS}    CaptchaBypass
${LASTNAME}          Benigno
${FIRSTNAME}         Bengie
${MIDNAME}           Asera
${CONTACTNUMBER}     09098336461
${EMAIL}             MACUNANAN@SSCGI.COM

*** Keywords ***
Login To System
    Input Text    id=UserName    ${USERNAME}
    Input Password    id=Password    ${PASSWORD}
    Input Text    id=UserCaptchaCode    ${CAPTCHA_BYPASS}
    Click Button    id=btnLogins

Navigate To Employee Management
    Wait Until Page Contains Element    xpath=//*[@id="UserManagement"]/span/span[1]
    Mouse Over    xpath=//*[@id="UserManagement"]/span/span[1]
    Wait Until Page Contains Element    xpath=//*[@id="USER"]/span/span[1]
    Mouse Over    xpath=//*[@id="USER"]/span/span[1]
    Wait Until Page Contains Element    xpath=//*[@id="Person/Index"]/a/span
    Mouse Over    xpath=//*[@id="Person/Index"]/a/span
    Click Element    xpath=//*[@id="Person/Index"]/a/span
    

    #navigate to edit page 
    Wait Until Element Is Visible    id=txtbxsearchField    timeout=10s
    Wait Until Element Is Enabled    id=txtbxsearchField    timeout=10s
    Input Text    id=txtbxsearchField   ${LASTNAME}
    Wait Until Element Is Visible    id=searchField    timeout=10s
    Click Element    id=searchField
    Wait Until Element Is Visible    xpath=//input[@id='editModule']    timeout=10s
    Wait Until Element Is Enabled    xpath=//input[@id='editModule']    timeout=10s
    Scroll Element Into View         xpath=//input[@id='editModule']
    Click Element                    xpath=//input[@id='editModule']


    #editing account 
    Wait Until Element Is Visible    id=MiddleName    timeout=10s
    Input Text                      id=MiddleName     ${MIDNAME}
    Execute JavaScript    window.scrollBy(0, 1000)

    #CLICK SAVE BUTTON
    Wait Until Element Is Visible    id=btnSubmit    timeout=10s
    Wait Until Element Is Enabled    id=btnSubmit    timeout=10s
    Scroll Element Into View         id=btnSubmit
    Click Element                    id=btnSubmit

    #CLICKING FOR CONFIRMATION TO SAVE  "no"
    Wait Until Element Is Visible    id=noBTL    timeout=10s
    Wait Until Element Is Enabled    id=noBTL    timeout=10s
    Scroll Element Into View         id=noBTL
    Click Element                    id=noBTL







*** Test Cases ***
Create Employee End-to-End Test
    [Documentation]    Full workflow to edit an employee in the system.
    
    Open Browser    ${URL}    edge
    Maximize Browser Window
    
    # --- LOGIN TO SYSTEM ---
    Login To System

    # --- NAVIGATE TO EMPLOYEE MANAGEMENT ---
    Navigate To Employee Management


    Close All Browsers
