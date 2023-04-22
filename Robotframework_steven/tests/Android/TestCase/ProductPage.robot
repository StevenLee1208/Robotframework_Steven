*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/ProductPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Suite Teardown    Close Application

*** Test Cases ***
[ProductPage] Check the function column at the bottom of the product page to display
    Enter Product Page In Keyword Search Way    電風扇
    Wait Until Element Should Be Visible    ${product_text_track}    5
    Wait Until Element Should Be Visible    ${product_text_cart}    5