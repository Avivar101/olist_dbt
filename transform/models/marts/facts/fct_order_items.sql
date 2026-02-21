select
    order_id,
    product_id,
    seller_id,
    count(*) as quantity,
    sum(price) as total_item_revenue,
    sum(freight_value) as total_freight_value

from {{ ref('stg_olist_order_items') }}
group by
    order_id,
    product_id,
    seller_id
