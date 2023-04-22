*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/IndexPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Suite Teardown    Close Application

*** Test Cases ***
[IndexPage] The search box displays normally
    Click search box
    Wait Until Element Should Be Visible    ${search_text_dailyRecommendation}    5
    [Teardown]    Click back button on search page