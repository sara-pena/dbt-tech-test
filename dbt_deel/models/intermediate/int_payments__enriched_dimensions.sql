with

staging_payments as (

    select * from {{ ref('stg_globepay__payments') }}

),

staging_chargebacks as (

    select * from {{ ref('stg_globepay__chargebacks') }}

)

select
    staging_payments.*,

    staging_chargebacks.has_chargeback

from staging_payments
left join staging_chargebacks using (chargeback_id)