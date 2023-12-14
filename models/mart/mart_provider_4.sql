{{config(materialized = "incremental")}}

with mart_provider as (
    select 
    {{source('VARSHITHAE','SEQ_01')}}.nextval surrogate_key, * from {{ref('intr_provider_1')}}
    {% if is_incremental() %}
    where SRC_UNIQ_ID not in (select distinct SRC_UNIQ_ID from {{this}})

    {% endif %}
)

select * from mart_provider


