*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/CartPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Test Teardown    Back to index page

Suite Teardown    Close Application

*** Test Cases ***
[CartPage] The checkout steps displays normally
    Click cart button
    Check If Login Status And Login
    Wait Until Element Should Be Visible    ${cart_text_buylist}    5
    Wait Until Element Should Be Visible    ${cart_text_paymentMethod}    5
    Wait Until Element Should Be Visible    ${cart_text_buyerInfo}    5
    Wait Until Element Should Be Visible    ${cart_text_complete}    5