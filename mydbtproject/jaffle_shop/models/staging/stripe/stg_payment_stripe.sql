select 
id as payment_id,
orderid as order_id,
paymentmethod as payment_method,
amount,
created as payment_date,
from {{ source('stripe', 'payment')}}
where status = 'success'