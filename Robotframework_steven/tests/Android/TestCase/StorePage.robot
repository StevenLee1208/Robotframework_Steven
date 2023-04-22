*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/StorePageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/SignPageVariable.txt
Resource    ../Variable/StorePageVariable.txt
Resource    ../Variable/RegionPageVariable.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Test Teardown    Run Keywords    Click index button

Suite Teardown    Close Application

*** Test Cases ***
[StorePage] Check Slideshow Image display normally
    Enter store page from index page    ${category_button_3c}    ${category_button_SanDisk}    ${region_button_USB2.0Storage}    ${region_button_CruzerBlade}
    Log    ${STORE_NAME_CATEGORY_TEXT}
    Element Should Contain Text    ${store_selectbox_StoreNameInFilter}    ${STORE_NAME_CATEGORY_TEXT}    message=None