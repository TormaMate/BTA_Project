***Settings***
Library   SeleniumLibrary
Library   BuiltIn
Library    String
Library    Collections
Variables    Variables.py

*** Variables ***
@{PRICES}
*** Keywords ***
Input Email    [Arguments]   ${string}
    Input Text    ${txt_email}    ${string}
    
Input Login Email    [Arguments]   ${string}
    Input Text    ${txt_login_email}    ${string}
    
Input Login Password    [Arguments]   ${string}
    Input Text    ${txt_login_password}    ${string}
    
Click Proceed
    #TODO xpath doesn't work properly due element attribute incosistency. 
    # 
    sleep    2
    Click Element    btn_proceed
    
Click Confirm
    sleep    2
    Click Element    btn_confirm
    
Click Bankwire
    Click Element    ${btn_bank_wire}
    
Agree Terms
    Select Checkbox    ${checkbox_agree_terms}
    
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
    [Documentation]
    ...    It checks if the product quantity is properly displayed
    ${sumOfItems}=    Sum Of Item Quantity    &{ITEMS}
    Wait Until Element is Visible    ${span_product_count}
    ${itemQuantity}=    Get Text    ${span_product_count}
    Should be Equal As Strings    ${itemQuantity}    ${sumOfItems}
    
Sum Of Item Quantity    [Arguments]    &{ITEMS}
    [Documentation]
    ...    It executes the calculation for 'Product Count Should Be Updated' 
    @{itemsQuantity}=    Get Dictionary Values    ${ITEMS}    sort_keys=False
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
    

Product Quantity Should Be The Same In Cart    [Arguments]    &{ITEMS}
    [Documentation]
    ...    Check the quantity of each products in the cart
    @{itemsQuantity}=    Get Dictionary Values    ${ITEMS}    sort_keys=False
    @{itemsName}=    Get Dictionary Keys    ${ITEMS}    sort_keys=False
    ${listLength}=    Get Length    ${itemsQuantity}
    FOR    ${i}    IN RANGE    ${listLength}
      ${textItemQuantity}=    Replace String    ${txt_quantity}    ::PLACEHOLDER::    ${itemsName}[${i}]
      ${cartQuantity}=    Get Element Attribute    ${textItemQuantity}    value
      Should Be Equal As Strings    ${cartQuantity}    ${itemsQuantity}[${i}]
    END
    
Items Should Present In Cart    [Arguments]    &{ITEMS}
    @{itemsName}=    Get Dictionary Keys    ${ITEMS}    sort_keys=False
    ${listLength}=    Get Length    ${itemsName}
    FOR    ${i}    IN RANGE    ${listLength}
        Table Should Contain    ${table_cart_summary}    ${itemsName}[${i}]    
    END
    
Product Prices Should Be The Same In Cart    [Arguments]    &{ITEMS}
    [Documentation]
    ...    It checks if the product prices are the same
    @{itemsName}=    Get Dictionary Keys    ${ITEMS}    sort_keys=False
    ${listLength}=    Get Length    ${itemsName}
    FOR    ${i}    IN RANGE    ${listLength}
      ${itemPrice}=    Replace String    ${span_cart_price}    ::PLACEHOLDER::    ${PRICES}[${i}]
      Should Be Equal As Strings    ${itemPrice}    ${itemsName}[${i}]
    END
    

Results Should Be Relevant    [Arguments]    ${search}
    @{elements}=    Get WebElements    ${a_results}
    ${listLength}=    Get Length    ${elements}
    FOR    ${i}    IN RANGE    ${listLength}
           ${titleAttr}=    Get Element Attribute     ${elements}[${i}]    title
           Should Start With    ${titleAttr}    ${search}
    END
    
    
    
Add Items    [Arguments]    &{ITEMS}
    [Documentation]
    ...    1. The keyword gets a dictionary which contains the items name and quantity 
    ...    2. It navigates to the product details by item name and puts the quantity into the input field
    ...    3. It puts the item into the cart
    ...    4. It repeats the process untill all of the items are in the cart
    ...     
    @{itemsList}=    Get Dictionary Keys    ${ITEMS}    sort_keys=False
    Log To Console    ${itemsList}
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
           
           Get And Save Item Prices    ${PRICES}    ${i}
           
           Click Element    ${span_add_to_cart}     
           
           Wait Until Element Is Visible    ${icon_ok}
           Go Back    
    END
    Click Element    ${buttonDetailsReplaced}      

Get and Save Item Prices    [Arguments]    ${PRICES}    ${i}
    [Documentation]
    ...    it gets and saves the item prices in a global list for assertion
    ${textAttr}=    Get Text     ${span_price}
    Insert Into List    ${PRICES}    ${i}    ${textAttr}
    Set Global Variable    @{PRICES}
      
 Delete Items     
    FOR    ${i}    IN RANGE    100
        ${isTrashIconPresent}=    Run Keyword And Return Status    Page Should Contain Element    ${a_substract}
        Exit For Loop If    ${isTrashIconPresent} == False
        Click Element    ${a_substract}
        sleep    5      
    END

Price Should Be Decreasing
    ${unitePrice}=    Get Text    ${span_unit_price}  
    ${unitePrice}=    Remove String    ${unitePrice}    $
    Log To Console    ${unitePrice}
    
    ${totalPriceBefore}=    Get Text    ${span_total_price}  
    ${totalPriceBefore}=    Remove String    ${totalPriceBefore}    $
    Log To Console    ${totalPriceBefore}
    
    ${totalPriceBefore}=    Evaluate    ${totalPriceBefore}-${unitePrice}
    Log To Console    ${totalPriceBefore}    

    Click Element    ${a_substract}
    sleep    4        

    ${totalPrice}=    Get Text    ${span_total_price}  
    ${totalPrice}=    Remove String    ${totalPrice}    $
    Log To Console    ${totalPrice}
    
    Should Be Equal As Strings    ${totalPriceBefore}    ${totalPrice}    
    
 Shopping Cart Empty Statement Should Be Visible
     Element Should Be Visible    ${p_warning} 
     
Order Reference Should Be The Same
    [Documentation]
    ...    It saves the order reference using regexp and checks if it is the same on "My Orders" page
    ...    
    ${getOrderReference}=    Get text    div_details_text
    ${getOrderReference}=    Get Regexp Matches    ${getOrderReference}    [A-Z]{9}
    
    Click Element    ${a_myorders}
    Page Should Contain    ${getOrderReference}   
           