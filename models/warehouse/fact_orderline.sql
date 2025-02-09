with sales_cleaned as (
    select *
    from {{ ref('sales_cleaned') }}
)

, final as (
    select 
        order_id                                        as order_id
        , sku                                           as product_id
        , {{ order_date_string_to_order_date('date') }} as order_date -- 04-30-22 -> 2022-01-30
        , quantity                                      as quantity
        , currency                                      as currency
        , amount                                        as amount
        -- Promotion_ids can differ per orderline, so it would make sense to have it in dim_orderline.
        -- One SKU can have multiple ASINs (Amazon product ID), probably different suppliers of the same product.
        -- The latest courier status can differ per sku in an order. To verify with business/source team.
        -- I chose to keep these 3 columns in the fact for now, although it may be better to move them to a new dimension: dim_orderline
        , promotion_ids                                 as promotion_ids
        , asin                                          as asin
        , courier_status                                as courier_status
    from sales_cleaned
)

select *
from final
