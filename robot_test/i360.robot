*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}               https://sysdevintegral360dev.sscgi.com/
${USERNAME}          admingreg
${PASSWORD}          P@ssw0rd
${CAPTCHA_BYPASS}    CaptchaBypass

*** Test Cases ***
i360 End-to-End Test
    Open Browser    ${URL}    edge
    Maximize Browser Window
    Input Text    id=UserName    ${USERNAME}
    Input Password    id=Password    ${PASSWORD}
    Input Text    id=UserCaptchaCode    ${CAPTCHA_BYPASS}
    Click Button    id=btnLogins

    Wait Until Page Contains Element    xpath=//span[contains(text(), "Reports")]    timeout=20s
    Mouse Over    xpath=//span[contains(text(), "Reports")]
    Click Element    xpath=//*[@id="BuiltInReport/Index"]/a/span

    Wait Until Element Is Visible    xpath=//*[@id="createForm"]/div/div[1]/div/div/table/tbody/tr[1]/td[2]/span/button    timeout=10s
    Click Button    xpath=//*[@id="createForm"]/div/div[1]/div/div/table/tbody/tr[1]/td[2]/span/button

    Wait Until Element Is Visible    xpath=//*[@id="reportcatalogs_listbox"]/li[4]    timeout=10s
    Click Element    xpath=//*[@id="reportcatalogs_listbox"]/li[4]

    Wait Until Element Is Visible    xpath=//*[@id="createForm"]/div/div[1]/div/div/table/tbody/tr[2]/td[2]/span/button
    Click Button    xpath=//*[@id="createForm"]/div/div[1]/div/div/table/tbody/tr[2]/td[2]/span/button
  
    Wait Until Element Is Visible    xpath=//*[@id="ReportNameId_listbox"]/li[2]    timeout=10s
    Click Element    xpath=//*[@id="ReportNameId_listbox"]/li[2]
    

    Wait Until Element Is Visible    xpath=//*[@id="reportParameterDiv"]/div/div/div/table/tbody/tr/td[2]/span/button[2]    timeout=10s
    Click Element    xpath=//*[@id="reportParameterDiv"]/div/div/div/table/tbody/tr/td[2]/span/button[2]

    Wait Until Element Is Visible    xpath=//a[@class='k-link' and @data-value='2025/3/3' and text()='3']
    Click Element    xpath=//a[@class='k-link' and @data-value='2025/3/3' and text()='3']


    Click Button    //*[@id="btnGenerateReport"]

    # Add more steps here as needed, instead of sleep
  

    Close Browser
