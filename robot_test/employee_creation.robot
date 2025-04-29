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

Fill Employee Details
    Wait Until Element Is Visible    xpath=//*[@id="btnCreate"]    timeout=10s
    Click Button    xpath=//*[@id="btnCreate"]

    # Select Employee Title
    Wait Until Element Is Visible    xpath=//*[@id="createForm"]/div[2]/div[2]/table/tbody/tr[1]/td[2]/span/button
    Click Element    xpath=//*[@id="createForm"]/div[2]/div[2]/table/tbody/tr[1]/td[2]/span/button
    Wait Until Element Is Visible    xpath=//*[@id="EmployeeTitleId_listbox"]/li[5]/span
    Click Element    xpath=//*[@id="EmployeeTitleId_listbox"]/li[5]/span

    # Fill Required Fields
    Input Text    xpath=//*[@id="LastName"]    ${LASTNAME}
    Input Text    xpath=//*[@id="FirstName"]   ${FIRSTNAME}
    Input Text    xpath=//*[@id="ContactNo"]   ${CONTACTNUMBER}
    Input Text    xpath=//*[@id="Email"]       ${EMAIL}

    # Select Employee Designation
    Wait Until Element Is Visible    xpath=//*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[2]/td[2]/span/button
    Click Element    xpath=//*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[2]/td[2]/span/button
    Wait Until Element Is Visible    xpath=//span[@class='k-list-item-text' and text()='AML201 - AML Designation']
    Click Element    xpath=//span[@class='k-list-item-text' and text()='AML201 - AML Designation']

    # Select Employee Status
    Wait Until Element Is Visible    xpath=//*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[3]/td[2]/span/button
    Click Button    xpath=//*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[3]/td[2]/span/button
    Wait Until Element Is Visible    xpath=//*[@id="EmployeeStatusId_listbox"]/li[5]
    Click Element    xpath=//*[@id="EmployeeStatusId_listbox"]/li[5]

    # Select Branch
    Wait Until Element Is Visible    xpath=//*[@id="SelectBranch"]    timeout=10s
    Scroll Element Into View         xpath=//*[@id="SelectBranch"]
    Click Button                     xpath=//*[@id="SelectBranch"]
    Wait Until Element Is Visible    xpath=//*[@id="BranchViewModel"]/div[3]/table/tbody/tr[1]/td[1]/button/span    timeout=10s
    Scroll Element Into View         xpath=//*[@id="BranchViewModel"]/div[3]/table/tbody/tr[1]/td[1]/button/span
    Click Element                    xpath=//*[@id="BranchViewModel"]/div[3]/table/tbody/tr[1]/td[1]/button/span

    # Select Office
    Wait Until Element Is Visible    xpath=//*[@id="createForm"]/div[4]/div[2]/table/tbody/tr[3]/td[2]/span/button
    Click Button    xpath=//*[@id="createForm"]/div[4]/div[2]/table/tbody/tr[3]/td[2]/span/button
    Wait Until Element Is Visible    xpath=//span[@class='k-list-item-text' and text()='000DEPT - Head Office Branch']  timeout=10s
    Click Element    xpath=//span[@class='k-list-item-text' and text()='000DEPT - Head Office Branch']




Submit Employee Form
    Execute JavaScript    window.scrollBy(0, 1000)
    Click Element    xpath=//*[@id="btnPostNew"]
    Wait Until Element Is Visible    id=SaveOnlyProcess    timeout=10s
    Click Element    id=SaveOnlyProcess
    Wait Until Element Is Visible    id=ProcessTransaction    timeout=10s
    Click Element    id=ProcessTransaction
    

Verify Employee Creation
    Wait Until Element Is Visible  xpath=//button[text()='OK']
    Click Element    xpath=//button[text()='OK']

*** Test Cases ***
Create Employee End-to-End Test
    [Documentation]    Full workflow to create an employee in the system.
    
    Open Browser    ${URL}    edge
    Maximize Browser Window
    
    # --- LOGIN TO SYSTEM ---
    Login To System

    # --- NAVIGATE TO EMPLOYEE MANAGEMENT ---
    Navigate To Employee Management

    # --- FILL EMPLOYEE DETAILS ---
    Fill Employee Details

    # --- SUBMIT FORM ---
    Submit Employee Form

    # --- VERIFY SUCCESS ---
    Verify Employee Creation

    Close All Browsers
