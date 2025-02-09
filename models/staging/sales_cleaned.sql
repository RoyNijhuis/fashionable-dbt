with source_data as (

    select "index" as index
        , "Order ID" as order_id
        , "Date" as date
        , "Status" as status
        , "Fulfilment" as fulfillment_method
        , "Sales Channel " as sales_channel
        , "ship-service-level" as ship_service_level
        , "Style" as style
        , "SKU" as sku
        , "Category" as category
        , "Size" as size
        , "ASIN" as ASIN
        , "Courier Status" as courier_status
        , "Qty" as quantity
        , "currency" as currency
        , "Amount" as amount
        , "ship-city" as ship_city
        , "ship-postal-code" as ship_postal_code
        , "ship-country" as ship_country
        , "promotion-ids" as promotion_ids
        , "B2B" as b2b
        , "fulfilled-by" as fulfilled_by
        , "Unnamed: 22" as unnamed_22_to_check -- TODO: Check with business what the meaning of this column is. Still ingest it so that we can use it later.
        , row_number() over (partition by "Order ID", "SKU", "ASIN" order by "index") as row_num
    from {{ ref('fashionable_sale_report') }}
)

, dedup_source_date as (
    -- Remove duplicate orderlines
    -- TODO: Contact source team to check order '407-8364731-6449117' with asin 'B09K3T675B'
    -- since that one is cancelled first and shipped later. This seems to be wrong.
    select *
    from source_data
    where row_num = 1
)

select *
from dedup_source_date
