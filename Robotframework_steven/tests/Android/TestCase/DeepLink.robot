*** Settings ***
Library    AppiumLibrary
Library    BuiltIn
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/DeepLinkMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../variable/DeepLinkVariable.txt
Resource    ../variable/ProductPageVariable.txt

*** Variables ***
${Keyword}


*** Test Cases ***
[DeepLink] Open Browser And Click Button
    Android Open Chrome Browser    
    Search item in Web    ${Keyword}
    Click Element If It Is Visible    ${accept_chrome_botton}
    Click Element If It Is Visible    ${confuse_negative_botton}
    Click Element If It Is Visible    ${dismiss_botton}
    FOR    ${i}    IN RANGE    10
    ${element_present}    Run Keyword And Return Status    Element Should Be Visible    ${First_Item}
    Run Keyword If    ${element_present}==${False}    Reload search Keyword
    Exit For Loop If    ${element_present}==${True} 
    Sleep    1s
    END
    Click Element After It Is Visible    ${first_item}    5
    Sleep    3
    Wait Until Element Should Be Visible    ${product_button_share}    10
    Close Application

# Share Botton Link
#     Click Element If It Is Visible    ${product_button_share}

#     # Check if the link is valid
#     ${link}    Get Element Attribute    ${product_button_shareLinkCopy}    href
#     Should Not Be Empty    ${link}
#     Log    ${link}
#     # Close the app
#     Close Application