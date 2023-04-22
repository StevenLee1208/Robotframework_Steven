*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/SitePageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/SitePageVariable.txt
Resource    ../Variable/CategoryPageVariable.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Suite Teardown    Close Application

*** Test Cases ***
[SitePage] Check to enter the brand hall correctly
    Enter site page from index page    ${category_button_communication}    ${category_button_Android}
    Wait Until Element Should Be Visible    xpath=//*[@resource-id="android:id/content"]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.TextView[1][contains(@text, 'Android')]    5