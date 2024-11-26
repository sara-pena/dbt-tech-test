with

successful_payments as (

    select * from {{ ref('int_successful_payments') }}

)

select * from successful_payments