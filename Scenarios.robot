*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Resource    CustomKeywords.robot

Test Teardown      Close Browser

*** Variables ***
${browser}    chrome
&{ITEMS}    Printed Dress=1    Printed Summer Dress=2    Printed Chiffon Dress=1
${searchingParameter}   Printed     

*** Test Cases ***
Successful registration
    Open Browser    http://automationpractice.com/index.php?controller=authentication&back=my-account    browser=${browser}
    Input Email    dummydumb49@mail.com
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

    
Searching for products
    Open Browser    http://automationpractice.com    browser=${browser}
    Input Search Parameter    ${searchingParameter}
    Click Search Button
    Wait For Result
    Results Should Be Relevant    ${searchingParameter}
    
Add products to cart from Popular tab on Home Page
    Open Browser    http://automationpractice.com    browser=${browser}
    Click Popular Button
    Add Items To the Cart    &{ITEMS}
    Page should Contain Message    Product successfully added to your shopping cart
    Product Count Should Be Updated    &{ITEMS}
    Navigate To The Cart
    Items Should Present In Cart    &{ITEMS}
    Product Quantity Should Be The Same In Cart    &{ITEMS}
    Product Prices Should Be The Same In Cart
    
Delete products from cart
    Open Browser    http://automationpractice.com    browser=${browser}
    Click Popular Button
    Add Items To the Cart    &{ITEMS}
    Navigate To The Cart
    Price Should Be Decreasing
    Delete Items
    Shopping Cart Empty Statement Should Be Visible 

Purchase products with bank wire
    Open Browser    http://automationpractice.com/index.php?controller=authentication&back=my-account    browser=${browser}
    Input Login Email    test@bta.com
    Input Login Password    123456
    Go To    http://automationpractice.com/index.php
    Click Popular Button
    Add Items To the Cart    &{ITEMS}
    Navigate To The Cart
    Click Proceed
    Click Proceed
    Agree Terms
    Click Proceed
    Click Bankwire
    Click Confirm
    Order Reference Should Be The Same
     