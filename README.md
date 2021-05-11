telepítés
könyvtárak
driverek
path

Requirements and Installation:
  1. install the latest version of Python: https://www.python.org/downloads/
  2. Add Python to PATH
  3. install the last stable version of Robot Framework: pip install robotframework
  4. Install SeleniumLibrary: pip install SeleniumLibrary
  5. To run your tests in different browsers, install the browser compatible version of geckodriver for firefox and chromedriver for chrome


Run Test Suit From CMD:  
  Firefox:
  robot --variable browser:firefox scenarios.robot
  
  Chrome:
  robot --variable browser:chrome scenarios.robot
