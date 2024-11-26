with

chargebacks_with_cvv_flag as (

    select * from {{ ref('int_chargebacks__is_cvv_provided') }}

),

selected_columns as (

    select
        chargeback_id,
        cvv_provided

    from chargebacks_with_cvv_flag

)

select * from selected_columns