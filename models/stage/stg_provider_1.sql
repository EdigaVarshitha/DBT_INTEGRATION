{{config(materialized="table")}}
with dbt_provider as (
    select *
    from {{source('VARSHITHAE','PROVIDER')}}
  
)

select * from dbt_provider