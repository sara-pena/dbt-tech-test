{%- set exchange_rates = ['EUR', 'MXN', 'CAD', 'USD', 'GBP', 'AUD', 'SGD'] -%}

with

payments as (

    select * from {{ ref('base_globepay__payments') }}

),

assign_exchange_rates as (

    select
        *,

        case
        {% for exchange_rate in exchange_rates -%}
                when currency = '{{ exchange_rate }}'
                then rates ->> '{{ exchange_rate }}'
        {%- endfor %}
        end as exchange_rate

    from payments

),

currency_conversions as (

    select
        payment_id,
        chargeback_id,
        payment_datetime_utc,
        state,
        cvv_provided,
        payment_amount,
        country,
        currency,

        (exchange_rate::numeric(13,2) * payment_amount)::numeric(13,2) as payment_amount_usd

    from assign_exchange_rates

)

select * from currency_conversions