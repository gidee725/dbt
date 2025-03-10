with customers as (
    select * from {{source('jaffle_shop', 'customers')}}
), 
orders as (
    select *from {{source('jaffle_shop', 'orders')}}

),
customer_orders as (
    select customer_id,
    min(order_date) as first_order_date,
    max(order_date) as latest_order_date,
    count( order_id) as number_of_orders
    from orders
    groub by 1        
           
),
final as (
    select 
    c.customer_id,
    c.first_name,
    co.first_order_date,
    co.latest_order_date,
    co.number_of_orders,
    from customers c
    left join customer_orders co
    on c.customer_id= co.customer_id

   
)
select *from final
