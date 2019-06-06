from selenium import webdriver

def getDriver():
    options = webdriver.ChromeOptions()
    options.add_argument("--no-sandbox")
    options.add_argument("--headless")
    return webdriver.Chrome("/chromedriver",chrome_options=options)

driver = getDriver()
driver.get("https://www.google.com")
print(driver.current_url)
driver.get_screenshot_as_file("/selenium-vol/images/image.png")
driver.close()