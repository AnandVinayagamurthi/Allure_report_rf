*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../Resources/common.robot
Variables    ../Datas/data.py
Variables    ../Datas/url.py
Variables    ../Datas/xpath.py
Resource    ../Testcase/tc01_support.robot

*** Test Cases ***
Log Telerik 2021 WinForms Release Data
    [Documentation]    This test case fetches and logs Telerik WinForms release titles and corresponding 2021 section summaries.
    Extract 2021 Release Titles And Sections
