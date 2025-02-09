with sales_cleaned as (
    select *
    from {{ ref('sales_cleaned') }}
)

, final as (
    select 
        sku        as product_id
        , style     as product_style
        , category  as product_category
        , size      as product_size
    from sales_cleaned
    group by sku, style, category, size
)

select *
from final
