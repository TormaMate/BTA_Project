***Settings***
Library   SeleniumLibrary
Library   BuiltIn
Library    String
Library    Collections
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
    
    

Page should Contain Message    [Arguments]   ${string}  
      Page Should Contain    ${string} 

Product Count Should Be Updated    [Arguments]    &{ITEMS}
    ${sumOfItems}=    Sum Of Item Quantity    &{ITEMS}
    Wait Until Element is Visible    ${span_product_count}
    ${itemQuantity}=    Get Text    ${span_product_count}
    Should be Equal As Strings    ${itemQuantity}    ${sumOfItems}
    
Sum Of Item Quantity    [Arguments]    &{ITEMS}
    @{itemsQuantity}=    Get Dictionary Values    ${ITEMS}
    ${listLength}=    Get Length    ${itemsQuantity}
    ${sumOfItems}    Set Variable    ${0}
    FOR    ${i}    IN RANGE    ${listLength}
        ${sumOfItems} =    Evaluate    ${sumOfItems}+${itemsQuantity}[${i}]      
    END
    [Return]    ${sumOfItems}

Click Popular Button
    Click Element    ${btn_popular}

Add Items To The Cart    [Arguments]    &{items}    
    Add Items    &{items}
    
Navigate To The Cart
    Click Element    ${a_shoping_cart}
    Wait Until Element Is Visible    ${a_cart_title}
    

Product Quantity Should Be Correct In Cart    [Arguments]    &{ITEMS}
    





Results Should Be Relevant    [Arguments]    ${search}
    [Documentation]
    ...    It checks if the results of the given search term are relevant
    ...    If not, it returns an error
    @{elements}=    Get WebElements    ${a_results}
    ${listLength}=    Get Length    ${elements}
    FOR    ${i}    IN RANGE    ${listLength}
           ${titleAttr}=    Get Element Attribute     ${elements}[${i}]    title
           Should Start With    ${titleAttr}    ${search}
    END
    
Add Items    [Arguments]    &{ITEMS}
    [Documentation]
    ...    1. The keyword gets a list of prices
    ...    2. Each prices belong to one of the popular items
    ...    3. As the for loop is looping through the list of the prices the xpath changes dynamically and refers to the belonging item.
    ...    4. The items will be added to the cart
    @{itemsList}=    Get Dictionary Keys    ${ITEMS}
    @{itemsQuantity}=    Get Dictionary Values    ${ITEMS}    sort_keys=False
    Log To Console    ${itemsQuantity}
    ${itemListLength}=    Get Length    ${itemsList}
    @{PRICES}=    Create List
    
    FOR    ${i}    IN RANGE    ${itemListLength}
           ${buttonDetailsReplaced}=    Replace String    ${btn_details}    ::PLACEHOLDER::    ${itemsList}[${i}]     
           Click Element    ${buttonDetailsReplaced}
           
           Wait Until Element Is Visible    ${txt_quantity_wanted}
           Clear Element Text    ${txt_quantity_wanted} 
           Input Text    ${txt_quantity_wanted}    ${itemsQuantity}[${i}]
           
           ${textAttr}=    Get Text     ${span_price}
           Insert Into List    ${PRICES}    ${i}    ${textAttr}  
           
           Click Element    ${span_add_to_cart}     
           
           Wait Until Element Is Visible    ${icon_ok}
           Go Back    
    END
    Click Element    ${buttonDetailsReplaced}
    Set Global Variable    @{PRICES}      
        
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
  
    
    
        
    

    