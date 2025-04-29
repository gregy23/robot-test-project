*** Settings ***
Library   SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${URL}               https://sysdevintegral360staging.sscgi.com/
${USERNAME}          admingreg
${PASSWORD}          P@ssw0rd
${CAPTCHA_BYPASS}    CaptchaBypass
${LASTNAME}          Benigno
${FIRSTNAME}         Bengie
${CONTACTNUMBER}     09098336461
${EMAIL}             MACUNANAN@SSCGI.COM


*** Test Cases ***
Create_employee End-to-End Test
    
    Open Browser    ${URL}    edge
    Maximize Browser Window
    Input Text    id=UserName    ${USERNAME}
    Input Password    id=Password    ${PASSWORD}
    Input Text    id=UserCaptchaCode    ${CAPTCHA_BYPASS}
    Click Button    id=btnLogins
    
    # hover ng usermanagement
    Wait Until Page Contains Element    //*[@id="UserManagement"]/span/span[1]
    Mouse Over    //*[@id="UserManagement"]/span/span[1]

    # hover ng user
    Wait Until Page Contains Element    //*[@id="USER"]/span/span[1]
    Mouse Over    //*[@id="USER"]/span/span[1]

    # hover ng employee
    Wait Until Page Contains Element    //*[@id="Person/Index"]/a/span
    Mouse Over    //*[@id="Person/Index"]/a/span
    Click Element    //*[@id="Person/Index"]/a/span
    
    #click ng add button sa employees index
    Wait Until Element Is Visible    //*[@id="btnCreate"]  timeout=10s
    Click Button    //*[@id="btnCreate"]
    
    #click dropdown button in employee title
    Wait Until Element Is Visible    //*[@id="createForm"]/div[2]/div[2]/table/tbody/tr[1]/td[2]/span/button
    Click Element    xpath=//*[@id="createForm"]/div[2]/div[2]/table/tbody/tr[1]/td[2]/span/button


    #select data from employee title 
    Wait Until Element Is Visible    //*[@id="EmployeeTitleId_listbox"]/li[5]/span
    Click Element    //*[@id="EmployeeTitleId_listbox"]/li[5]/span

    #fill up the mandatoru fields
   Input Text    //*[@id="LastName"]    ${LASTNAME} 
   Input Text    //*[@id="FirstName"]   ${FIRSTNAME} 
   Input Text    //*[@id="ContactNo"]   ${CONTACTNUMBER}
   Input Text    //*[@id="Email"]       ${EMAIL}


    #selecting employees designation fields
   Wait Until Element Is Visible    //*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[2]/td[2]/span/button
   Click Element    //*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[2]/td[2]/span/button
   Wait Until Element Is Visible     xpath=//span[@class='k-list-item-text' and text()='AML201 - AML Designation'] 
   Click Element     xpath=//span[@class='k-list-item-text' and text()='AML201 - AML Designation']

   #selecting employee status drop box

   Wait Until Element Is Visible    //*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[3]/td[2]/span/button
   Click Button    //*[@id="createForm"]/div[4]/div[1]/table/tbody/tr[3]/td[2]/span/button
   Wait Until Element Is Visible    //*[@id="EmployeeStatusId_listbox"]/li[5]
   Click Element    //*[@id="EmployeeStatusId_listbox"]/li[5]

    
   # Select branch fields
    Wait Until Element Is Visible    //*[@id="SelectBranch"]    timeout=10s
    Scroll Element Into View         //*[@id="SelectBranch"]
    Click Button                     //*[@id="SelectBranch"]
    Wait Until Element Is Visible    //*[@id="BranchViewModel"]/div[3]/table/tbody/tr[1]/td[1]/button/span    timeout=10s
    Scroll Element Into View         //*[@id="BranchViewModel"]/div[3]/table/tbody/tr[1]/td[1]/button/span
    Click Element                    //*[@id="BranchViewModel"]/div[3]/table/tbody/tr[1]/td[1]/button/span


    

   #select office fields
    Wait Until Element Is Visible    //*[@id="createForm"]/div[4]/div[2]/table/tbody/tr[3]/td[2]/span/button
    Click Button    //*[@id="createForm"]/div[4]/div[2]/table/tbody/tr[3]/td[2]/span/button
    Wait Until Element Is Visible    xpath=//li[.//span[text()='AML - AML']]
    Click Element    xpath=//li[.//span[text()='AML - AML']]

    Execute JavaScript    window.scrollBy(0, 1000)
    Click Element    //*[@id="btnPostNew"]
    Close All Browsers




  




