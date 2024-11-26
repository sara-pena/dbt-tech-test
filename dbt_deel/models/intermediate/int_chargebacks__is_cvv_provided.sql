with

staging_chargebacks as (

    select * from {{ ref('stg_globepay__chargebacks') }}

),

staging_payments as (

    select * from {{ ref('stg_globepay__payments') }}

),

chargebacks_is_cvv_provided as (

select
    staging_chargebacks.*,

    staging_payments.cvv_provided

from staging_chargebacks
left join staging_payments using (chargeback_id)
where has_chargeback

)

select * from chargebacks_is_cvv_provided