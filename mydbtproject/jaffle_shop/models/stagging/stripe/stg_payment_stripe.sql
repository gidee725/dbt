select 
id as payment_id,
orderid as order_id,
paymentmethod as payment_method,
amount,
created as payment_date,
from raw.stripe.payments
where status = 'success'