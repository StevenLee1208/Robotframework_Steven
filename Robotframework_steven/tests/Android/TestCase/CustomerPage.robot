*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/CustomerPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/CustomerPageVariable.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Test Teardown    Click index button

Suite Teardown    Close Application

*** Test Cases ***
[CustomerPage] The checkout steps displays normally
    Click customer button
    Wait Until Element Should Be Visible    ${customer_text_coins}    2
    Wait Until Element Should Be Visible    ${customer_text_cashPoints}    2
    Wait Until Element Should Be Visible    ${customer_text_topup}    2
    Wait Until Element Should Be Visible    ${customer_text_giftCertificate}    2
    Scroll Until Element Found    ${customer_text_memberVersion}