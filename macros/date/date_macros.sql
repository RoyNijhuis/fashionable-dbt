{% macro order_date_string_to_order_date(date_string) -%}
    -- Converts date from MM-DD-YY to YYYY-MM-DD format
    CAST(CONCAT(
        '20',
        SUBSTRING({{ date_string }}, 7, 2),
        '-',
        SUBSTRING({{ date_string }}, 1, 2),
        '-',
        SUBSTRING({{ date_string }}, 4, 2)
     ) AS DATE)
{%- endmacro %}
