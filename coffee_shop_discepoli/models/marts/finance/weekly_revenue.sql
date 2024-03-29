{{
    config(
        materialized='incremental'
    )
}}

with weekly_revenue_base as (
  select * from {{ ref('int_coffee_shop__weekly_revenue_base') }}
  {% if is_incremental() %}
    where week >= (select max(week) from {{ this }})
  {% endif %}
)

select
  week
  , product_category
  , customer_type
  , sum(price) as revenue
from weekly_revenue_base
group by 1,2,3
order by 1,2
