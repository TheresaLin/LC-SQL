-- Write an SQL query to find the following for each invoice_id:
-- * customer_name: The name of the customer the invoice is related to.
-- * price: The price of the invoice.
-- * contacts_cnt: The number of contacts related to the customer.
-- * trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. (i.e His/Her email exists in the Customers table.)



-- Ａ表先計算發票擁有者有多少聯繫人
-- Ｂ表計算聯繫人中有多少有存在customers表裡，這邊特別的是用name連接
with A as(
    select customer_id, customer_name, count(contact_name) as "contacts_cnt" 
    from customers cu left join contacts con on cu.customer_id = con.user_id group by 1
), B as(
    select user_id, count(contact_name) as "trusted_contacts_cnt" 
    from customers cu, contacts con where customer_name = contact_name group by 1
    )
select invoice_id, customer_name, price, 
       ifnull(contacts_cnt,0) as "contacts_cnt", 
       ifnull(trusted_contacts_cnt,0) as "trusted_contacts_cnt" 
from invoices i join A on i.user_id = A.customer_id left join B on i.user_id = B.user_id order by 1