*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    RequestsLibrary
Library    RPA.Crypto
Library    String
Library    Collections



*** Keywords ***
Login Application
    [Documentation]    Using this keyword we can Browserstack website.
    [Arguments]   ${Browser_url} 
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    # Call Method    ${options}    add_argument    --headless    
    ${driver}    Create Webdriver    Chrome    options=${options}
    Set Window Size    1920    1080
    Go To    ${Browser_url}
    Maximize Browser Window
    Set Selenium Speed    700milliseconds
    # Use Encryption Key    ${public_key}
    # ${Decry}    Decrypt String    ${encry}
    # Log    ${Decry}
Wait Until Element is present then click the element
    [Documentation]    Using this keyword we can perform click Element
    [Arguments]    ${Element}
    Wait Until Page Contains Element    ${Element}    50
    Wait Until Keyword Succeeds    6    7    Click Element    ${Element}


request common
    ${data}    Create Dictionary    name= Anand    Skill=robot     place= chennai
    Log    ${data}
    Dictionary Should Contain Key    ${data}    name
    Log    ${data}[name]


Search Data
    [Documentation]    using this keyword we can search data(All)
    [Arguments]    ${Element}    ${Name}
    Wait Until Element is present then click the element    ${Element}
    Press Keys    ${Element}    CTRL+A+BACKSPACE
    Sleep    1
    Press Keys    ${Element}    ${Name}

Check text is present
    [Documentation]    using this keyword we can check text is present
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}    50
    Page Should Contain    ${text}

check text isn't present
    [Documentation]    using this keyword we can check text isn't present
    [Arguments]    ${text}
    Wait Until Page Does Not Contain    ${text}    50
    Page Should Not Contain    ${text}

Check element is present
    [Documentation]    using this keyword we can check element is present
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}    50
    Page Should Contain Element    ${element}

Check element isn't present
    [Documentation]    using this keyword we can check element isn't present
    [Arguments]    ${element}
    Wait Until Page Does Not Contain Element    ${element}    50
    Page Should Not Contain Element    ${element}

Check element is disabled
    [Documentation]    Using this keyword we can check element is disabled
    [Arguments]    ${Element}
    Wait Until Element is present then click the element    ${Element}
    Element Should Be Disabled    ${Element}

Check element is enable
    [Documentation]    Using this keyword we can check element is disabled
    [Arguments]    ${Element}
    Wait Until Element is present then click the element    ${Element}
    Element Should Be Enabled    ${Element}





Click the Kebab button 
    [Documentation]    Using this keyword we can click kebab(All)
    [Arguments]    ${Element}    ${name}    
    ${Kebab}    Format String    ${Element}    name=${name}
    Wait Until Element is present then click the element    ${Kebab}

Check data is not present
    [Documentation]    Using this keyword we can verify the data(Portfolio,PPG,Product/Platform) did not present 
    [Arguments]   ${element}  ${name}
    ${Data}    Format String    ${element}    name=${name}
    Check element isn't present    ${Data} 

Check data is present
    [Documentation]    Using this keyword we can verify the data(Portfolio,PPG,Product/Platform) is created
    [Arguments]    ${element}    ${name}
    ${Data}    Format String    ${element}    name=${name}
    Check element is present    ${Data}

Navigate to Created data
    [Documentation]    Using this keywork we can navigate to Created data(All)
    [Arguments]    ${Element}    ${name}
    ${Portfolio}    Format String    ${Element}    name=${name}
    Wait Until Element is present then click the element    ${Portfolio}

Delete the Created data
    [Documentation]    Using this keyword we can click delete data(All)  
    [Arguments]    ${Element}    ${name}    ${Element2}    
    ${Delete}    Format String    ${Element}    name=${name}
    Wait Until Element is present then click the element    ${Delete}
    Wait Until Element is present then click the element    ${Element2}

Click the Button or Navigate Back
    [Documentation]    Using this keyword we can click button and Navigate back  
    [Arguments]    ${element}    ${name}
    ${Click_Button}    Format String    ${element}    name=${name}
    Wait Until Element is present then click the element    ${Click_Button}


"Close the Browser"
    Close Browser

