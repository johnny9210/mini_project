from selenium import webdriver
import time
from bs4 import BeautifulSoup
def name(n):
    driver = webdriver.Chrome(executable_path="./chromedriver.exe")
    driver.get("http://www.interpark.com/malls/index.html?gateTp=1")
    tag =driver.find_element_by_xpath("/html/body/div[1]/div[4]/div/div[2]/div/div[1]/label/input")
    tag.send_keys(n)  # 입력
    driver.implicitly_wait(10) # seconds
    btn=driver.find_element_by_xpath('/html/body/div[1]/div[4]/div/div[2]/div/div[1]/button')
    btn.click()
    driver.implicitly_wait(10) # seconds
    print(driver.find_element_by_xpath('//*[@id="_TOURListLi"]/li[1]/div[2]/div[1]/span').text)
    # print(driver.find_element_by_xpath('//*[@id="_TOURListLi"]/li[1]/div[2]/div[1]/a'.text))
    # print(driver.find_element_by_xpath('//*[@id="_TOURListLi"]/li[1]/div[2]/div[1]/div[2]/span/strong'.text))
    # print('=========================================')
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')
    data = soup.select_one('#_TOURListLi')
    name=[]
    price=[]
    result=dict()
    for i in data.select('li .name'):
        name.append(i.text)
    for i in data.select('div.price'):
        price.append(i.text)
    re=[]
    for i in range(1,len(price)):
        dic = {'name_' : name[i], 'price_':price[i]}    
        re.append(dic)
    
    driver.close()
    return re

    # dic = {'name_' : name, 'price_':price}
    # print(re)
    
