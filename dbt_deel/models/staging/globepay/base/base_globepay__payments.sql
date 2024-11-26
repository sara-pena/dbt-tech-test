with

source as (

    select * from {{ source('deel_raw', 'payments') }}

),

renamed as (

    select
        ref as payment_id,
        external_ref as chargeback_id,
        date_time::timestamp as payment_datetime_utc,
        state,
        cvv_provided::boolean as cvv_provided,
        amount::numeric(13,2) as payment_amount,
        country,
        currency,
        rates

    from source

)

select * from renamed