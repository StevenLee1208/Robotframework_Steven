*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/SignPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/CategoryPageVariable.txt
Resource    ../Variable/SignPageVariable.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Test Teardown    Run Keywords    Click index button

Suite Teardown    Close Application

*** Test Cases ***
[SignPage] Check Slideshow Image display normally
    Enter sign page from index page    ${category_button_merch}
    Wait Until Element Is Visible    ${sign_text_categoryPart}
    # Wait Until Element Is Visible    ${slideshow_element_locator}
    # ${slideshow_images} =    Get Web Elements    ${slideshow_image_locator}
    # ${current_image} =    Get Element Attribute    ${slideshow_images}[0]    src
    # Wait Until Keyword Succeeds    5s    1s    Should Not Be Equal    ${current_image}    ${empty_image_src}
    # ${i} =    Set Variable    1
    # : FOR    ${image}    IN    @{slideshow_images}[1:]
    # \    ${next_image} =    Get Element Attribute    ${image}    src
    # \    Wait Until Keyword Succeeds    5s    1s    Should Not Be Equal    ${next_image}    ${empty_image_src}
    # \    Should Not Be Equal    ${next_image}    ${current_image}
    # \    Set Variable    ${current_image}
    # \    Set Variable    ${i+1}
