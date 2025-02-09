with sales_cleaned as (
    select *
    from {{ ref('sales_cleaned') }}
)

, final as (
    select 
        sku        as product_id
        , style     as style
        , category  as category
        , size      as size
    from sales_cleaned
    group by sku, style, category, size
)

select *
from final
