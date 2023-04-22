import os
import sys
import time
import subprocess
import platform
import shutil
import datetime
import requests
import json
import subprocess
from robot.api import ExecutionResult

devicename = sys.argv[1]
port = sys.argv[2]
keyword = sys.argv[3]

list_of_files = []  # all test case names list
failed_tests = []  # failed test case names list
total_elapsed_time = 0  # total run time
passCases = []  #all passCases name
failCases = [] #all fallCases name

python_file_path = os.path.dirname(os.path.abspath(__file__))
current_path = os.path.realpath(os.path.abspath(os.getcwd()))
log_dir_path = os.path.join(python_file_path, "log")
time_dir_name = os.path.join(log_dir_path, datetime.datetime.now().strftime('%Y%m%d-%H%M%S').format())

os.makedirs(log_dir_path, exist_ok=True)  # create log directory
os.makedirs(time_dir_name, exist_ok=True)  # create run time directory

# determine whether the current system is windows or darwin
if platform.system().lower() == "windows":  # windows
    robot_file_path = "{}\\TestCase\\".format(python_file_path)
    output_file = current_path + "\\output.xml"
    report_file = current_path + "\\report.html"
    log_file = current_path + "\\log.html"
    webhook_url = python_file_path + "\\url.txt"
elif platform.system().lower() == "darwin":  # mac os
    robot_file_path = "{}/TestCase/".format(python_file_path)
    output_file = current_path + "/output.xml"
    report_file = current_path + "/report.html"
    log_file = current_path + "/log.html"
    webhook_url = python_file_path + "/url.txt"

# append absolute path of all robot files to a list
for filename in os.listdir(robot_file_path):
    if filename.endswith(".robot"):
        list_of_files.append(os.path.join(robot_file_path, filename))

start_time = datetime.datetime.now()  # start time


for file_name in list_of_files:
    if "DeepLink.robot" not in file_name:
        cmd = "robot --variable devicename:{} --variable port:{} {}".format(devicename, port, file_name)
    else:
        cmd = "robot --variable devicename:{} --variable port:{} --variable keyword:{} {}".format(devicename, port, keyword, file_name)
    subprocess.run(cmd, shell=True)

    # get the base filename
    base_file_name = os.path.basename(file_name).replace('.robot', '')
    # create a directory with the base filename in the log directory
    log_file_path = os.path.join(time_dir_name, base_file_name)
    os.makedirs(log_file_path, exist_ok=True)
    # Get testcase name and status by Robot API
    suite = ExecutionResult(output_file).suite
    for test in suite.tests:
        if test.status == 'PASS':
            passCases.append(test.name)
        else:
            failCases.append(test.name)
    # move each log file to corresponding path
    shutil.move(output_file, log_file_path)
    shutil.move(report_file, log_file_path)
    shutil.move(log_file, log_file_path)

end_time = datetime.datetime.now()  # end time
total_time = end_time - start_time  # calculate run time in seconds
# remove microseconds 
start_time_str = str(start_time).split('.')[0]  
end_time_str = str(end_time).split('.')[0]
total_time_str = str(total_time).split('.')[0]

# Test Rate caculate
failCasesNumber = len(failCases)
passCasesNumber = len(passCases)
totalCases = passCasesNumber + failCasesNumber
successRate = passCasesNumber / totalCases
failCases = '\n'.join(failCases)

# Get App version by adb command
get_app_version = subprocess.run(["adb", "shell", "pm", "dump", "com.PChome.Shopping"], stdout=subprocess.PIPE)
get_app_version = get_app_version.stdout.decode('utf-8')
version_line = [line for line in get_app_version.split('\n') if 'versionName' in line]
version_name = version_line[0].split('=')[1]

# If there is a Fail case in this cycle, the picture will be the picture of fail
if failCasesNumber == 0:
    imageURL = "data:image/jpeg;base64,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"
else:
    imageURL = "https://www.driverknowledgetests.com/resources/wp-content/uploads/2018/09/fail-driving-test.jpg"

# the format of send report to chat
json_test_report = {
"cardsV2": [
{
"cardId": "unique-card-id",
"card": {
    "header": {
    "title": "Android regression test",
    "subtitle": "ALL Page test",
    "imageUrl":
    "{}".format(imageURL),
    "imageType": "CIRCLE",
    },
    "sections": [
    {
        "uncollapsibleWidgetsCount": 1,
        "widgets": [
        {
            "decoratedText": {
            "topLabel": "Case成功率",
            "text": "{:.2f}%({}/{}) ".format(successRate*100,passCasesNumber,totalCases),
            }
        },
        {
            "decoratedText": {
            "topLabel": '失敗case名稱',
            }
        },
        {
            "textParagraph": {
            "text": '{}'.format(failCases)
            }
        },
        {
          "decoratedText": {
            "topLabel": "測試開始時間",
            "text": "{}".format(start_time_str),
          }
        },
        {
          "decoratedText": {
            "topLabel": "測試結束時間",
            "text": "{}".format(end_time_str),
          }
        },
        {
          "decoratedText": {
            "topLabel": "總花費時間",
            "text": "{}".format(total_time_str),
          }
        },
        {
            "decoratedText": {
            "topLabel": "平台",
            "text": "{}".format('Android'),
            }
        },
        {
            "decoratedText": {
            "topLabel": "APP版本號",
            "text": "{}".format(version_name),
            }
        },
        ],
    },
    ],
},
}
],
}

try:
    with open(webhook_url, mode='r', encoding='utf-8') as f:
        WEBHOOK_URL = f.read()
    # # Set HTTP headers and send the test report in JSON format by POST
    headers = {'Content-Type': 'application/json'}
    response = requests.post(url=WEBHOOK_URL, headers=headers, data=json.dumps(json_test_report), verify=False)

    # Check the HTTP response status code to determine whether the test report is sent successfully
    print('POST Status Code: %s' % response.status_code)
    if response.status_code == 200:
        print('Successfully send test report!!')
    else:
        print('Fail to send test report!!')
        
except:
    print('POST Status Code: %s' % response.status_code)
    print("Fail to send test report!!")
# try:
#     if failCasesNumber != 0:
#         with open(webhook_url, mode='r', encoding='utf-8') as f:
#             WEBHOOK_URL = f.read()
#         # # Set HTTP headers and send the test report in JSON format by POST
#         headers = {'Content-Type': 'application/json'}
#         response = requests.post(url=WEBHOOK_URL, headers=headers, data=json.dumps(json_test_report), verify=False)

#         # Check the HTTP response status code to determine whether the test report is sent successfully
#         print('POST Status Code: %s' % response.status_code)
#         if response.status_code == 200:
#             print('Successfully send test report!!')
#         else:
#             print('Fail to send test report!!')
#     else:
#         print('No fail test case \OAO/')

# except:
#     print('POST Status Code: %s' % response.status_code)
#     print("Fail to send test report!!")