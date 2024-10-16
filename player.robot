*** Settings ***
Library     Browser

*** Variables ***
${URL}    https://parodify.vercel.app/
${play}    xpath=//h6[text()="Bughium"]/..//button[contains(@class,"play")]
${pause}    xpath=//h6[text()="Bughium"]/..//button[contains(@class,"pause")]


*** Test Cases ***
Example Test
    New Browser    browser=chromium    headless=false
    New Page    ${URL}  
    Get Title    ==    Parodify by Papito
    Get Text    css=.logged-user   contains    Fernando Papito


    Click    ${play}
    Wait For Elements State    ${pause}    visible    2
    Click    ${pause}

    Sleep    5