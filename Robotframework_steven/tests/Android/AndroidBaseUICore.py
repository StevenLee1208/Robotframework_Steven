import os

def GetDeviceInfo(devicename, port):
    if(devicename == "galaxy_s9"):
        desired_caps = {
        'platformName' : 'Android',
        'platformVersion' : '9.0',
        'deviceName' : '1cf350ecb80c7ece',
        'appPackage' : 'com.PChome.Shopping',
        'appActivity' : 'com.PChome.Shopping.MainActivity'
    }
    elif(devicename == "ZenFone_4"):
        desired_caps = {
        'platformName' : 'Android',
        'platformVersion' : '7.1.1',
        'deviceName' : 'H9AZCY03H8735ZB',
        'appPackage' : 'com.PChome.Shopping',
        'appActivity' : 'com.PChome.Shopping.MainActivity'
    }
    elif(devicename == "Pixel_6a_Jio"):
        desired_caps = {
        'platformName' : 'Android',
        'platformVersion' : '12',
        'deviceName' : '27071JEGR21711',
        'appPackage' : 'com.PChome.Shopping',
        'appActivity' : 'com.PChome.Shopping.MainActivity'
    }
    elif(devicename == "Pixel_6a_Steven"):
        desired_caps = {
        'platformName' : 'Android',
        'platformVersion' : '12',
        'deviceName' : '27071JEGR19433',
        'appPackage' : 'com.PChome.Shopping',
        'appActivity' : 'com.PChome.Shopping.MainActivity'
    }
    webdriver_url = 'http://localhost:{}/wd/hub'.format(port)
    value = [webdriver_url, desired_caps['platformName'], desired_caps['platformVersion'], desired_caps['deviceName'], desired_caps['appPackage'], desired_caps['appActivity']]
    return value