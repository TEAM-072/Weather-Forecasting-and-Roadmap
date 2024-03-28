import requests as req
import json, base64, os

# Create a Seperate Text File for the API KEY

def keyData():
    
    with open('Key.txt', 'r') as F:
        Key = F.read()
        F.close()
    return Key

def getData(cityName):

    Key = keyData()

    URL = f"https://api.openweathermap.org/data/2.5/weather?q={cityName}&appid={Key}&units=metric"
    R = req.get(URL).content.decode('utf-8')
    R = json.loads(R)    
    return R



cityName = input("\nEnter City Name: ")

D = getData(cityName)

# print("\n\n",D[0],"\n\n",D,"\n\n")
os.system('clear')
print("\n\n",D,"\n\n")