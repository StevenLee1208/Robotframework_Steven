*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/RegionPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/CategoryPageVariable.txt
Resource    ../Variable/RegionPageVariable.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Test Teardown    Run Keywords    Click index button

Suite Teardown    Close Application

*** Test Cases ***
[RegionPage] Check Slideshow Image display normally
    Enter region page from index page    ${category_button_3c}    ${category_button_SanDisk}
    Wait Until Element Should Be Visible    ${region_text_mainEvent}    5
    Wait Until Element Should Be Visible    ${region_text_product}    5
    Wait Until Element Should Be Visible    ${region_text_productCategory}    5