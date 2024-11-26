with

payments_with_dimensions as (

    select * from {{ ref('int_payments__enriched_dimensions') }}

),

selected_columns as (

    select
        payment_id,
        chargeback_id,
        has_chargeback,
        payment_datetime_utc,
        state,
        payment_amount,
        payment_amount_usd,
        country,
        currency

    from payments_with_dimensions

)

select * from selected_columns