*** Settings ***
Documentation    Test the links on webPage
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.google.com

*** Test Cases ***
FindLinks
    Open Browser    ${URL}    chrome
    wait until page contains    ${URL}
    Maximize Browser Window
    title should be     Google
    ${search_box}   set variable    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input
    element should be enabled   ${search_box}
    element should be visible   ${search_box}
    input text      xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input        robotframework
    Press Keys      xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input       ENTER
    Sleep   10
    Wait Until Element Is Visible  //a[@href='https://robotframework.org/']

    ${href_fLink}=  get text    xpath:(//a//cite[contains(text(),"http")])[1]
    log to console      ${href_fLink}
    ${first_link}=  get text    xpath:(//a//h3[contains(text(),"Robot Framework")])[1]
    log to console      ${first_link}

    @{LinkItems}    create list
    FOR  ${i}    IN RANGE    5   9
        ${href_OfLink}=  get text    xpath:(//a//cite[contains(text(),"http")])[${i}]
        log to console      ${href_OfLink}
        ${text_OfLink}=  get text    xpath:(//a//h3[contains(text(),"Robot Framework")])[${i}]
        log to console      ${text_OfLink}
    END

    Close Browser

*** Keywords ***
#write_variable_in_file
#  [Arguments]       ${variable}
#  Create File       ${C:\Users\pooshind2\Desktop\Project\RobotFrameworkAssignment\Resultfile.txt}   ${variable}