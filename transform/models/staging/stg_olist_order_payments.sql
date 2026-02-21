with source as (
        select * from {{ source('olist', 'order_payments') }}
  ),
  renamed as (
      select
          cast(order_id as varchar) as order_id,
          cast(payment_sequential as integer) as payment_sequential,
          cast(payment_type as varchar) as payment_type,
          cast(payment_value as float) as payment_value,
          cast(payment_installments as integer) as payment_installments
      from source
  )
  select * from renamed