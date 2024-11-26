with

source as (

    select * from {{ source('deel_raw', 'chargebacks') }}

),

renamed as (

    select
        external_ref as chargeback_id,
        chargeback::boolean as has_chargeback

    from source

)

select * from renamed