*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Amazon Search
    [Documentation]    Make a basic search in Amazon
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To    https://www.amazon.com/
    Input Text    //input[@id="twotabsearchtextbox"]    Nike
    Click Button    //input[@type='submit']
    Click Element    //*[@id='p_72/2661618011']/span/a/section/span
    Wait Until Page Contains    Next    timeout= 2 minutes
    Sleep    30 seconds
    Close Browser
