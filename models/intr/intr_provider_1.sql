{{config(materialized="table")}}

with provider_1 as (
    select * from {{ref('stg_provider_1')}}
),
provider_2 as (
    select *, CONCAT(PROVIDERID, '_' , PROVIDERTYPE) as SRC_UNIQ_ID
    from provider_1
),
provider_3 as (
    select *, CURRENT_TIMESTAMP() as MOD_DT from provider_2
)

select * from provider_3