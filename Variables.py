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

#Shoping Cart
btn_shoping_cart="//a[@title='View my shopping cart']"
a_cart_title="//h1[@id='cart_title']"

