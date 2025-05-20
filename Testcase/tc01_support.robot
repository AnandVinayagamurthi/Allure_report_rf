*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../Resources/common.robot
Variables    ../Datas/data.py
Variables    ../Datas/url.py
Variables    ../Datas/xpath.py
Resource    ../Testcase/tc01.robot

*** Keywords ***
Extract 2021 Release Titles And Sections
    [Documentation]    Extracts release titles and related paragraphs from Telerik WinForms release history page for the year 2021.

    Login Application    ${telerik_url}

    ${Dates_count}      Get Element Count    ${paragraph_xpath}
    ${output_dict}      Create Dictionary

    FOR    ${index}    IN RANGE    1    ${Dates_count}+1
    # all release titles
    
        ${Titles}     Format String    ${TITLE_DYNAMIC}     index=${index}
        ${paragraphs}   Format String    ${paragraph_xpath_DYNAMIC}   index=${index}
    # all 2021-related sections/paragraphs

        ${title_text}      Get Element Attribute    ${Titles}     ${ATTRIBUTE}
        ${section_text}    Get Element Attribute    ${paragraphs}   ${ATTRIBUTE}

        Set To Dictionary  ${output_dict}     ${title_text}=${section_text}
    END

    Log    ${output_dict}
    
    "Close the Browser"