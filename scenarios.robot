*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Resource    CustomKeywords.robot

*** Variables ***
${browser}    chrome
@{itemPrices}    16.51    50.99    28.98
${searchingParameter}   Printed     

*** Test Cases ***
Successful registration
    Open Browser    http://automationpractice.com/index.php?controller=authentication&back=my-account    browser=${browser}
    Input Email    dummy@mail.com
    Click Submit Button
    Wait For Form
    Select Title
    Input Firstname    Jack
    Input Lastname    Dummy
    Input Passwd    12345ASD 
    Select Day    1
    Select Month    2
    Select Year    1990
    Input Address    Kossuth utca 7
    Input City    Florida
    Select State    9
    Input Postcode    00000
    Input Phone    0123546789
    Input alias    My address
    Click Submit Create Button
    Wait For Login    
    User Name Should Be    Jack Dummy
    Web Location Should Be    http://automationpractice.com/index.php?controller=my-account
    Close Browser

    
Searching for products
    Open Browser    http://automationpractice.com    browser=${browser}
    Input Search Parameter    ${searchingParameter}
    Click Search Button
    Wait For Result
    Search For Printed    ${searchingParameter}
    Close Browser
    
Add products to cart from Popular tab on Home Page
    Open Browser    http://automationpractice.com    browser=${browser}
    Click Popular Button
    Add Items & Check Message And Quantit    @{itemPrices}
    Click Cart
    Wait For Cart
    Check Product Quantity In The Cart    @{itemPrices}
    # TODO    Check Items Quantity in Cart, Check Items in Cart, Check Total Amount
    Close Browser
    
# TODO    Delete products from cart
    

# TODO    Purchase products with bank wire
    
     