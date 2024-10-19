*** Settings ***
Library     Browser    jsextension=${EXECDIR}/resources/module.js

Test Setup       Start session
Test Teardown    Close session

*** Variables ***
${URL}    https://parodify.vercel.app/


*** Test Cases ***
Deve tocar uma música mockada
    ${song_name}    Set Variable    Mockado com sucesso >:D   

    Mock My Song

    Go To    ${URL}

    Get Title    ==    Parodify by Papito
    Get Text    css=.logged-user   contains    Fernando Papito

    ${play}    Get play button    ${song_name}
    ${pause}    Get pause button    ${song_name}

    Click    ${play}

    Wait For Elements State    ${pause}    visible    2
    Wait For Elements State    ${play}    visible    7


*** Keywords ***
Start session
    New Browser    browser=chromium    headless=false
    New Page    about:blank


Close session
    Take Screenshot


Get play button
    [Arguments]    ${getSong_Name}

    ${play}    Set Variable
    ...    xpath=//h6[text()="${getSong_Name}"]/..//button[contains(@class,"play")]
    
    [RETURN]    ${play}

Get pause button
    [Arguments]    ${getSong_Name}

    ${pause}    Set Variable
    ...    xpath=//h6[text()="${getSong_Name}"]/..//button[contains(@class,"pause")]
    
    [RETURN]    ${pause}