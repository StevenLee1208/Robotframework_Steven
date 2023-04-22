*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/CategoryPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Test Teardown    Click index button

Suite Teardown    Close Application

*** Test Cases ***
[CategoryPage] The sign names displays normally
    Click category button
    Wait Until Element Should Be Visible    ${category_button_3c}    2
    Wait Until Element Should Be Visible    ${category_button_merch}    2
    Wait Until Element Should Be Visible    ${category_button_nb}    2
    Wait Until Element Should Be Visible    ${category_button_communication}    2
    Wait Until Element Should Be Visible    ${category_button_digit}    2
    Wait Until Element Should Be Visible    ${category_button_appliance}    2
    Wait Until Element Should Be Visible    ${category_button_dailyUse}    2
    Wait Until Element Should Be Visible    ${category_button_motherAndBaby}    2
    Wait Until Element Should Be Visible    ${category_button_food}    2
    Wait Until Element Should Be Visible    ${category_button_life}    2
    Scroll    ${category_button_life}    ${category_button_merch}
    Wait Until Element Should Be Visible    ${category_button_casual}    2
    Wait Until Element Should Be Visible    ${category_button_health}    2
    Wait Until Element Should Be Visible    ${category_button_makeup}    2
    Wait Until Element Should Be Visible    ${category_button_fashion}    2
    Wait Until Element Should Be Visible    ${category_button_home}    2
    Wait Until Element Should Be Visible    ${category_button_book}    2
    Wait Until Element Should Be Visible    ${category_button_eTicket}    2
    Wait Until Element Should Be Visible    ${category_button_enjoyLife}    2