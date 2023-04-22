# Run test cases with Robot Framework

### Directory Structure
```
├─data
│  └─Android
│          env.yaml
├─tests
│   └─Android
│          AndroidBaseUICore.py
│          ├─Keyword (一連串動作封裝成function)
│          │   ├─  LoginLogoutMethod.txt
│          │   └─  CartMethod.txt
│          ├─TestCase (robot TC)
│          │   ├─  LoginLogout.robot
│          │   └─  Cart.robot
│          └─Variable (xpath/變數定義)
│              ├─  LoginLogoutVariable.txt
│              └─  CartVariable.txt
├─ log.html
├─ output.xml
├─ report.html
├─ README.md
└─ requirements.txt
```

### Testing tools
- Language: Robot Framework, Python
- Tool: Appium

### Steps
1. Pip install the requirements
    ```pip install -r requirements.txt ```
2. Run robot on terminal each of the following options
    
    (1) For one robot file : ```robot --variable devicename:<devicename> --variable port:<port> .\tests\Android\TestCase\<robotfilename>.robot```
    
    (2) For DeepLink.robot : ```robot --variable devicename:<devicename> --variable port:<port> --variable keyword:<keyword> .\tests\Android\TestCase\DeepLink.robot```

    (3) For all robot file : ```py .\tests\Android\AndroidRunRobot.py <devicename> <port> '<keyword>'```
3. If you want to run some specific test suites / test cases, you can add tag in your robot file. Then you can use --include(-i) or --exclude(-e) add tag name as your terminal argument. Like this
    ```robot -i regression <robotfilename>.robot```