#Registration page
txt_email="//input[@id='email_create']"
btn_submitCreate="//button[@id='SubmitCreate']"
txt_firstname="//input[@id='customer_firstname']"
txt_lastname="//input[@id='customer_lastname']"
radio_mr="//label[@for='id_gender1']"
txt_pwd="//input[@id='passwd']"
select_days="//select[@id='days']"
select_months="//select[@id='months']"
select_years="//select[@id='years']"
txt_address="//input[@id='address1']"
txt_city="//input[@id='city']"
select_state="//select[@id='id_state']"
txt_postcode="//input[@id='postcode']"
txt_phone="//input[@id='phone']"
txt_alias="//input[@id='alias']"
btn_submitAccount="//button[@id='submitAccount']"
txt_login_email="//input[@id='email']"
txt_login_password="//input[@id='passwd']"

#Account page
span_account="//span[./ancestor::a/@class='account']"

#Main Page (Search)
txt_search="//input[@id='search_query_top']"
btn_search="//button[@type='submit' and ./preceding-sibling::input/@id='search_query_top']"
ul_waitforresult="//ul[@class='product_list grid row']"
a_results="//a[@class='product-name' and ./ancestor::ul/@class='product_list grid row']"

#Main page (Popular Products)
btn_popular="//a[contains(text(),'Popular')]"
btn_close_window="//span[@title='Close window']"
icon_ok="//i[@class='icon-ok']"
a_shoping_cart="//a[@title='View my shopping cart']"

#Shoping Cart
a_cart_title="//h1[@id='cart_title']"
span_product_count="//span[@class='ajax_cart_quantity']"
txt_quantity="//input[./ancestor::td/preceding-sibling::td/descendant::a/text()='::PLACEHOLDER::']"
table_cart_summary="//table[@id='cart_summary']"
span_cart_price="//span[@class='price' and ./ancestor::td/@data-title='Unit price' and ./ancestor::td/preceding-sibling::td/descendant::a/text()='::PLACEHOLDER::']"
span_unit_price="//span[@class='price' and ./ancestor::span/@class='price']"
span_total_price="//span[@id='total_price']"
a_substract="//a[@title='Subtract']"
p_warning="//p[@class='alert alert-warning' and text()='Your shopping cart is empty.']"

#Payment
checkbox_agree_terms="//input[@name='cgv']"
btn_proceed="//*[self::button or self::p or self::a][@name='processAddress' or @name='processCarrier' or @class='cart_navigation button' or @title='Proceed to checkout']"
btn_bank_wire="//a[@title='Pay by bank wire']"
btn_confirm="//a[@title='Proceed to checkout']"
div_details_text="//div[@class='box']"

#Item Details
btn_details="//span[text()='More' and ./ancestor::div/preceding-sibling::h5/child::a/@title='::PLACEHOLDER::']"
span_price="//span[@id='our_price_display']"
span_add_to_cart="//span[contains(text(),'Add to cart')]"
txt_quantity_wanted="//input[@id='quantity_wanted']"

#Footer
a_myorders="//a[text()='My orders']"

