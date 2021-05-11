Requirements and Installation:
  1. install the latest version of Python: https://www.python.org/downloads/
  2. Add Python to the PATH
  3. install the last stable version of Robot Framework: pip install robotframework
  4. Install SeleniumLibrary: pip install SeleniumLibrary
  5. To run your test cases in different browsers, install the browser compatible version of geckodriver for firefox and chromedriver for chrome
      https://github.com/mozilla/geckodriver/releases
      https://chromedriver.chromium.org/downloads
  6. Add the webdriver's folder to the PATH
  7. If you are working with RED, add the path of SeleniumLibrary/_init_.py to red.xml to provide Selenium Keywords
      

Run Test Suit From CMD:  
  
  Firefox:
  robot --variable browser:firefox scenarios.robot
  
  Chrome:
  robot --variable browser:chrome scenarios.robot
