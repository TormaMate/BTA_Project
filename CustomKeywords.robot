***Settings***
Library   SeleniumLibrary
Library   BuiltIn
Library    String
Variables    Variables.py

*** Variables ***


*** Keywords ***
Input Email    [Arguments]   ${string}
    Input Text    ${txt_email}    ${string}
    
Click Submit Button
    Click Element    ${btn_submitCreate}
    
Wait For Form
   Wait Until Element Is Visible    ${txt_firstname}
   
Select Title
    Wait Until Page Contains Element    ${radio_mr}
    Click Element    ${radio_mr}
    
Input Firstname    [Arguments]   ${string}
   Input Text    ${txt_firstname}    ${string} 

Input Lastname    [Arguments]   ${string}
   Input Text    ${txt_lastname}    ${string} 

Input Passwd    [Arguments]   ${string}
   Input Text    ${txt_pwd}    ${string} 

Select Day    [Arguments]   ${string}
   Select From List By Value    ${select_days}    ${string} 

Select Month    [Arguments]   ${string}
   Select From List By Value    ${select_months}    ${string} 

Select Year    [Arguments]   ${string}
   Select From List By Value    ${select_years}    ${string} 

Input Address    [Arguments]   ${string}
   Input Text    ${txt_address}    ${string} 

Input City    [Arguments]   ${string}
   Input Text    ${txt_city}    ${string} 

Select State    [Arguments]   ${string}
   Select From List By Value    ${select_state}    ${string} 

Input Postcode    [Arguments]   ${string}
   Input Text    ${txt_postcode}    ${string} 

Input Phone    [Arguments]   ${string}
   Input Text    ${txt_phone}    ${string} 

Input alias    [Arguments]   ${string}
   Input Text    ${txt_alias}    ${string} 

Click Submit Create Button
    Click Element    ${btn_submitAccount}
    
Wait For Login
    Wait Until Element Is Visible    ${span_account}
    
User Name Should Be    [Arguments]   ${string}
    Element Text Should Be    ${span_account}    ${string}    
        
Web Location Should Be    [Arguments]   ${string}
    Location Should Be    ${string}    




Input Search Parameter     [Arguments]   ${searchingParameter}       
    Input Text    ${txt_search}    ${searchingParameter}
    
Click Search Button
    Click Element    ${btn_search}
    
Wait For Result
    Wait Until Element Is Visible    ${ul_waitforresult}
    
Search For Printed    [Arguments]   ${searchingParameter}   
    Validate Search    ${searchingParameter}




Click Popular Button
    Click Element    ${btn_popular}

Add Items & Check Message And Quantit    [Arguments]    @{itemPrices}    
    Add Items and Check    @{itemPrices}
    
Click Cart
    Click Element    ${btn_shoping_cart}
    
Wait For Cart
    Wait Until Element Is Visible    ${a_cart_title}
    
Check Product Quantity In The Cart    [Arguments]    @{itemPrices}
    Check Product Quantity    @{itemPrices}





Validate Search    [Arguments]    ${search}
    [Documentation]
    ...    It checks if the results of the given search term are relevant
    ...    If not, it returns an error
    @{elements}=    Get WebElements    ${a_results}
    ${listLength}=    Get Length    ${elements}
    FOR    ${i}    IN RANGE    ${listLength}
           ${titleAttr}=    Get Element Attribute     ${elements}[${i}]    title
           Should Start With    ${titleAttr}    ${search}
    END
    
Add Items and Check  [Arguments]    @{itemPrices}
    [Documentation]
    ...    1. The keyword gets a list of prices
    ...    2. Each prices belong to one of the popular items
    ...    3. As the for loop is looping through the list of the prices the xpath changes dynamically and refers to the belonging item.
    ...    4. The items will be added to the cart
    ...    5. It cheks if the right quantity of items are displayed
    ...    6. It checks if the "successfull" message is displayed
    ${itemListLength}=    Get Length    ${itemPrices}
    
    FOR    ${i}    IN RANGE    ${itemListLength}
           Run Keyword And Ignore Error    Click Element    ${btn_close_window} 
           Click Element    //span[text()='Add to cart' and contains(./ancestor::div/preceding-sibling::div/child::span/text(),'${itemPrices}[${i}]')]
           Wait Until Element Is Visible    ${icon_ok}    
    END
        Sleep    2
        Page Should Contain Element     //span[text()='${itemListLength}' and ./ancestor::div/@class='clearfix']        
        Page Should Contain    Product successfully added to your shopping cart
        Click Element    ${btn_close_window}
        Calculate Prices    @{itemPrices}
        
        
Calculate Prices    [Arguments]    @{itemPrices}
  [Documentation]
  ...   It Calculates and returns the sum of the item prices added to the shoping cart 
  ...     
  ${totalPrice} =    set variable    ${0}
  ${productPrice} =    set variable    ${0}
  ${itemListLength}=    Get Length    ${itemPrices}
  FOR    ${i}    IN RANGE    ${itemListLength}
      ${totalPrice} =    Evaluate    ${totalPrice}+${itemPrices}[${i}]
      log to console  ${totalPrice}
  END
  ${TOTAL_PRICE}    Set Global Variable    ${totalPrice}
  
Check Product Quantity   [Arguments]    @{prices}
    [Documentation]
    ...    Checks if the displayed quantity of the products is correct.
    ${itemListLength}=    Get Length    ${prices}
    Page Should Contain Element    //span[text()='${itemListLength}' and @class='ajax_cart_quantity']
    
    
        
    

    