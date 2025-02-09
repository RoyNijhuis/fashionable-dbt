with sales_cleaned as (
    select *
    from {{ ref('sales_cleaned') }}
)

, final as (
    select 
        order_id                as order_id
        , status                as status
        , fulfillment_method    as fulfillment_method
        , sales_channel         as sales_channel
        , ship_service_level    as ship_service_level
        , ship_city             as ship_city
        , ship_postal_code      as ship_postal_code
        , ship_country          as ship_country
        , fulfilled_by          as fulfilled_by
        , b2b                   as b2b
    from sales_cleaned
    group by order_id, date, status, fulfillment_method, sales_channel, ship_service_level, ship_city, ship_postal_code, ship_country, fulfilled_by, b2b
)

select *
from final
