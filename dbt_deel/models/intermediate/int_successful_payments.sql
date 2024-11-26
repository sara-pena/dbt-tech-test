with

payments_enriched_dimensions as (

    select * from {{ ref('int_payments__enriched_dimensions') }}

),

successful_payments as (

    select
        payment_id,
        payment_datetime_utc

    from payments_enriched_dimensions
    where state = 'ACCEPTED'
        and not has_chargeback

)

select * from successful_payments