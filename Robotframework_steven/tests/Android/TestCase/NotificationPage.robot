*** Setting ***
Library    AppiumLibrary
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/NotificationPageMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt

Suite Setup    Run Keywords    Android Open PChome24h Application
...            AND             Close Ad

Test Teardown    Click index button

Suite Teardown    Close Application

*** Test Cases ***
[NotificationPage] The notification function bar displays normally
    Click notification button
    Wait Until Element Should Be Visible    ${notification_button_activity}    2
    Wait Until Element Should Be Visible    ${notification_button_order}    2
    Wait Until Element Should Be Visible    ${notification_button_qa}    2