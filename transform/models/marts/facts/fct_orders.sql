with orders as (
    select * from {{ ref('stg_olist_orders') }}
),
order_items as (
    select * from {{ ref('stg_olist_order_items') }}
)

select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    cast(order_purchase_timestamp as date) as order_date,
    count(oi.order_item_id) as items_count
from orders o
join order_items oi
    on o.order_id = oi.order_id

group by
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp
